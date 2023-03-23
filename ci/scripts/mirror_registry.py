import argparse
import requests
import subprocess

parser = argparse.ArgumentParser()
parser.add_argument('--token', required=True, help="Gitlab private access token with api permission")
args = parser.parse_args()

images = requests.get('https://git-bzh.alfred.cafe/api/v4/groups/5/registry/repositories?per_page=100', headers={
    'PRIVATE-TOKEN': args.token
})

for image in images.json():
    newName = 'ucd3ovrtlbq.ctf.bzh:5050/breizh-ctf-2023/docker/' + image['name']

    subprocess.call(['docker', 'pull', image['location']])
    subprocess.call(['docker', 'tag', image['location'], newName])
    subprocess.call(['docker', 'push', newName])
    subprocess.call(['docker', 'rmi', image['location'], newName])
