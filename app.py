import dash
from dash import dcc, html
from dash.dependencies import Input, Output, State
import plotly.express as px
from plotly.subplots import make_subplots
import pandas as pd
import dash_bootstrap_components as dbc  # Importing the design library

# Reading data
data = pd.read_csv("data.csv")  # Make sure to change the file path

# Cleaning column names to remove "_"
data.columns = [col.replace("_", " ").title() for col in data.columns]

# Create the app with Bootstrap design
app = dash.Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])

# Page design
app.layout = dbc.Container(
    [
        dbc.Row(
            dbc.Col(
                html.H1("Historical Trends in Automobile Sales", className="text-center text-primary my-4"),
                width=15
            )
        ),
        dbc.Row(
            [
                dbc.Col(
                    dcc.DatePickerRange(
                        id='date-range',
                        start_date='2000-01-01',
                        end_date='2023-01-01',
                        display_format='YYYY-MM-DD',
                        with_portal=True,
                        className="mb-3"
                    ),
                    width=6
                ),
                dbc.Col(
                    dcc.Dropdown(
                        id='chart-type',
                        options=[
                            {'label': 'Bubble', 'value': 'bubble'},
                            {'label': 'Pie', 'value': 'pie'},
                            {'label': 'Line Plot', 'value': 'line'},
                            {'label': 'Scatter Plot', 'value': 'scatter'},
                            {'label': 'Subplot', 'value': 'subplot'}
                        ],
                        placeholder='Select Chart Type',
                        className="mb-3"
                    ),
                    width=6
                ),
            ]
        ),
        dbc.Row(
            [
                dbc.Col(
                    dcc.Dropdown(
                        id='x-axis',
                        options=[{'label': col, 'value': col} for col in data.columns],
                        placeholder='Select X-Axis',
                        className="mb-3"
                    ),
                    width=6
                ),
                dbc.Col(
                    dcc.Dropdown(
                        id='y-axis',
                        options=[{'label': col, 'value': col} for col in data.columns],
                        placeholder='Select Y-Axis',
                        className="mb-3"
                    ),
                    width=6
                )
            ]
        ),
        dbc.Row(
            dbc.Col(
                html.Button("Search", id='search-btn', n_clicks=0, className="btn btn-primary"),
                className="text-center mb-3"
            )
        ),
        dbc.Row(
            dbc.Col(
                html.Div(id='chart-output', className='chart-container'),
                width=12
            )
        )
    ],
    fluid=True
)

# 'chart-output' component with new content based on the inputs provided by the user.
# The user must specify the start and end date, the x and y axis, and the chart type.
@app.callback(
    Output('chart-output', 'children'),
    [Input('search-btn', 'n_clicks')],
    [State('date-range', 'start_date'), 
     State('date-range', 'end_date'), 
     State('x-axis', 'value'), 
     State('y-axis', 'value'), 
     State('chart-type', 'value')])
def update_chart(n_clicks, start_date, end_date, x_col, y_col, chart_type):
    if n_clicks > 0 and x_col and y_col and chart_type:
        if 'Year' not in data.columns or 'Automobile Sales' not in data.columns or 'Recession' not in data.columns:
            return html.Div("Missing necessary columns for the selected chart type.", style={'color': 'red'})
        
        filtered_data = data[(data['Year'] >= int(start_date[:4])) & (data['Year'] <= int(end_date[:4]))]
        grouped_data = filtered_data.groupby(x_col, as_index=False)[y_col].mean()
        
        if chart_type == 'line':
            fig = px.line(grouped_data, x=x_col, y=y_col, title=f'{y_col} Over Time')
        elif chart_type == 'scatter':
            fig = px.scatter(grouped_data, x=x_col, y=y_col, title=f'{y_col} vs {x_col}')
        elif chart_type == 'bubble':
            fig = px.scatter(filtered_data, x=x_col, y=y_col, size='Automobile Sales', color='Recession', title=f'{y_col} vs {x_col}')
        elif chart_type == 'pie':
            fig = px.pie(filtered_data, values=y_col, names=x_col, title=f'{y_col} Distribution by {x_col}')
        elif chart_type == 'subplot':
            fig = make_subplots(rows=2, cols=2, subplot_titles=[f'{y_col} vs {x_col}', 'Monthly Sales', 'Advertisement Expenditure', 'Unemployment Rate Effect'])
            for trace in px.line(grouped_data, x=x_col, y=y_col).data:
                fig.add_trace(trace, row=1, col=1)
            for trace in px.line(filtered_data, x='Month', y='Automobile Sales').data:
                fig.add_trace(trace, row=1, col=2)
            for trace in px.pie(filtered_data, values='Advertising Expenditure', names='Vehicle Type').data:
                fig.add_trace(trace, row=2, col=1)
            for trace in px.bar(filtered_data, x='Unemployment Rate', y='Automobile Sales').data:
                fig.add_trace(trace, row=2, col=2)
            fig.update_layout(title_text=f'Subplot: {y_col} vs {x_col}')
        else:
            return html.Div("Invalid chart type selected.", style={'color': 'red'})
        return dcc.Graph(figure=fig)
    return html.Div("Please select all required inputs.", style={'color': 'red'})


if __name__ == '__main__':
    app.run_server(debug=True)
