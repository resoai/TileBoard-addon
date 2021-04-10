#!/usr/bin/env python3

from os import makedirs, path, symlink, walk
from sys import exit
import sys


def main(src_dir: str, dest_dir: str) -> None:
    src_dir_abs = path.realpath(src_dir)
    dest_dir_abs = path.realpath(dest_dir)
    for dirpath, _, filenames in walk(src_dir_abs):
        for filename in filenames:
            rel_dir = path.relpath(dirpath, src_dir_abs)
            filename_dest_dir = path.join(dest_dir_abs, rel_dir)
            # Special-case "custom.css" which can be in the root but should be linked to "styles/".
            if rel_dir == '.' and filename == 'custom.css':
                filename_dest_dir = path.join(filename_dest_dir, 'styles')
            if not path.isdir(filename_dest_dir):
                makedirs(filename_dest_dir)
            symlink(path.join(dirpath, filename), path.join(filename_dest_dir, filename))


if __name__ == '__main__':
    args = sys.argv
    if len(args) < 3:
        print('Error. Missing required arguments')
        exit(1)
    main(args[1], args[2])
