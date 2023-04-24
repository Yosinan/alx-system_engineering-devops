#!/usr/bin/python3
'''
an API that returns information about his/her TODO list progress.
'''
import json
import requests
import sys

empApi = 'https://jsonplaceholder.typicode.com/users/{}'
todoApi = 'https://jsonplaceholder.typicode.com/todos?userId={}'


def get_employee_name(emp_id):
    '''
    returns employee name based on the id it receives
    '''
    res_employee = requests.get(empApi.format(emp_id)).json()
    return res_employee


def get_todo_list(emp_id):
    '''
    returns the TODO lists of the specific employee based on the ID
    '''
    res_todo = requests.get(todoApi.format(emp_id)).json()

    return res_todo


def to_JSON(em, task):
    '''
    convert the todos of the employee into JSON file
    '''
    res = {}
    res[emp_id] = []
    for todo in task:
        row = {'task': todo.get('title'), 'completed': todo.get('completed'),
               'username': em.get('username')}
        res[emp_id].append(row)
    with open('{}.json'.format(emp_id), 'w') as f:
        json.dump(res, f)


if __name__ == '__main__':
    '''
    if the specified argument's length not equal to 2 it will give an errror
    '''
    if len(sys.argv) != 2:
        print('Usage: python todo.py <employee_id>')
        sys.exit(1)

    emp_id = sys.argv[1]
    if not emp_id.isdigit():
        print('please enter a no for the employee id\n')
        sys.exit(1)
    emp = get_employee_name(emp_id)
    todo_list = get_todo_list(emp_id)
    to_JSON(emp, todo_list)
