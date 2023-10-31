import subprocess

def run_command(command):
    result = subprocess.run(command, capture_output=True, text=True)
    if result.returncode == 0:
        print(f'Command: {command} executed successfully')
    else:
        print('Command failed with the following output:')
        print(result.stderr)
        exit(-1)

    print(result.stdout)


# REPLACE PROJECT FOLDER
run_command(['sudo', 'rm', '-r', '/opt/ticketing-machine'])
run_command(['sudo', 'cp', '-r', 'ticketing-machine', '/opt/'])
run_command(['sudo', 'chown', '-R', 'www-data:www-data', '/opt/ticketing-machine'])
run_command(['sudo', 'rm', '-r', '/opt/ticketing-www'])
run_command(['sudo', 'cp', '-r', 'ticketing-www', '/opt/'])
run_command(['sudo', 'chown', '-R', 'www-data:www-data', '/opt/ticketing-www'])
command = ['sudo', 'chmod', 'u+rw', '/var/log/apache2/ticketing_api/api-error.log']
run_command(command)
# UPDATE DEPENDENCIES
run_command(['sudo', '/opt/ticketing-var/venv38/bin/pip', 'install', '-r', '/opt/ticketing-machine/requirements.txt'])

command = ['sudo', 'cp', 'manage.sh', '/opt/ticketing-commands/']
run_command(command)
command = ['sudo', 'chmod', '+x', '/opt/ticketing-commands/manage.sh']
run_command(command)
print("ESTAMOS POR FALLAR")
run_command(['sudo', '/opt/ticketing-commands/manage.sh', 'makemigrations'])
run_command(['sudo', '/opt/ticketing-commands/manage.sh', 'migrate'])
print("TODO EN ORDEN")
  
