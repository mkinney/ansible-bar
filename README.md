Notes:
- Switched to just using the windows box that Stefan creates. See https://github.com/StefanScherer/packer-windows/releases/tag/2017.12.14 for source.

- Install virtualenv. Run the following:
    virtualenv venv
    source venv/bin/activate
    pip install -r requirements

- Used these values to create this role: molecule init role -d molecule_vagrant -r bar -d vagrant
- Added a simple win_file task.
- Removed any dirs not used (like handlers, vars, defaults, meta, etc)
- Modified molecule/default/molecule.yml to use Stefan's box.
- Commented out steps in molecule/default/prepare.yml.
