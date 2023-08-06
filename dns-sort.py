#!/usr/bin/env python3

import sys
import subprocess

def main():
    if len(sys.argv) != 2:
        print("Usage:", sys.argv[0], "<input_file>")
        sys.exit(1)

    input_file = sys.argv[1]

    try:
        with open(input_file, 'r') as f:
            domains = f.read().splitlines()
    except FileNotFoundError:
        print("Input file '{}' not found.".format(input_file))
        sys.exit(1)

    unique_ips = set()

    for domain in domains:
        try:
            output = subprocess.check_output(['dig', '+short', 'A', domain], text=True)
            ips = output.strip().split('\n')
            unique_ips.update(ips)
        except subprocess.CalledProcessError:
            print("Failed to resolve IP for '{}'".format(domain))

    for ip in sorted(unique_ips):
        print(ip)

if __name__ == "__main__":
    main()
