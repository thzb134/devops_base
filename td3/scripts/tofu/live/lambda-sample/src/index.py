def handler(event, context):
    if event['httpMethod'] == 'GET':
        return {
            'statusCode': 200,
            'body': 'Hello from GET!'
        }
    elif event['httpMethod'] == 'POST':
        return {
            'statusCode': 200,
            'body': 'Hello from POST!'
        }
    else:
        return {
            'statusCode': 405,
            'body': 'Method Not Allowed'
        }
