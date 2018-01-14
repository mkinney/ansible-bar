Notes:
- Switched to just using the windows box that Stefan creates. See https://github.com/StefanScherer/packer-windows/releases/tag/2017.12.14 for source.

- Install virtualenv. Run the following:
    virtualenv venv
    source venv/bin/activate
    pip install -r requirements.txt

- Upgrade pip packages:
    pip install pip-upgrader
    pip-upgrade
    pip freeze > requirements.txt

- Used these values to create this role: molecule init role -d molecule_vagrant -r bar -d vagrant
- Added a simple win_file task.
- Removed any dirs not used (like handlers, vars, defaults, meta, etc)
- Modified molecule/default/molecule.yml to use Stefan's box.
- Commented out steps in molecule/default/prepare.yml.

- I could not get testinfra to work with Windows, so I am going to try using inspec
    sudo gem install inspec
  then from the molecule/default/inspec dir, you can now run:
    inspec exec foo_spec.rb -t winrm://vagrant@127.0.0.1:55985 --password='vagrant'

This should give you output that looks like this:


	./verify 

	Profile: tests from molecule/default/inspec/foo_spec.rb (tests from molecule.default.inspec.foo_spec.rb)
	Version: (not specified)
	Target:  winrm://vagrant@http://127.0.0.1:55985/wsman:3389

	  ✔  foo: See if foo file exists
	     ✔  File c:\foo.conf should exist

	Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
	Test Summary: 1 successful, 0 failures, 0 skipped


- So, you can now:
   molecule lint
   molecule converge
   molecule idempotence
   ./verify
   molecule destroy
