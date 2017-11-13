#!/usr/bin/ruby

def dir_exist(dir)
	File.exists? File.expand_path(dir)
end

def copy(dir1, dir2)
	cmd = "cp #{dir1} #{dir2}"
	exec(cmd)
end

def start_program
	if !dir_exist('~/.i3')
		exec('mkdir ~/.i3')
	end
	copy('i3/config', '~/.i3/config')
	copy('vim/.vimrc', '~/.vimrc')
	copy('zsh/.zshrc','~/.zshrc')
end

