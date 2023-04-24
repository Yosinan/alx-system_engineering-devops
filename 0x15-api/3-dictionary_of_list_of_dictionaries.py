#!/usr/bin/python3
'''
an API that returns information about his/her TODO list progress.
'''
import json
import requests
import sys

empApi = 'https://jsonplaceholder.typicode.com/users/'


def get_employees():
    '''
    returns all employees
    '''
    res_employee = requests.get(empApi).json()
    return res_employee


def all_to_JSON(employee):
    '''
    convert the todos of the employee into JSON file
    '''
    address = 'https://jsonplaceholder.typicode.com/'
    res = {}
    for emp in employee:
        user_id = emp.get('id')
        todos = requests.get(
            address + 'todos?userId={}'.format(user_id)).json()
        res[user_id] = []
        for todo in todos:
            row = {'username': emp.get('username'), 'task': todo.get('title'),
                   'completed': todo.get('completed')}
            res[user_id].append(row)
    with open('todo_all_employees.json', 'w') as f:
        json.dump(res, f)


if __name__ == '__main__':
    '''
    calls the functions that will export data in the JSON format.

    '''
    emp = get_employees()
    all_to_JSON(emp)
