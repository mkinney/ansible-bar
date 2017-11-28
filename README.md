Notes:
- Clone packer repo: git clone https://github.com/StefanScherer/packer-windows.git
- Build a Windows 2016 core vagrant box: packer build --only vmware-iso windows_2016_core.json
- Add the newly built vagrant box: vagrant box add --name windows-2016-core windows_2016_core_vmware.box
- Verify the box has been added: vagrant box list
- Used these values to create this role: molecule init role -d molecule_vagrant -r bar -d vagrant
- Added a simple win_file task.
- Removed any dirs not used (like handlers, vars, defaults, meta, etc)
- Modified molecule/default/molecule.yml to use windows-2016-core.
- Commented out steps in molecule/default/prepare.yml.
