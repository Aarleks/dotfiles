#!/usr/bin/env ruby

require 'open3'

source = ARGV[0]

def Rmarkdown(source)
	Open3.popen2("R -e 'rmarkdown::render("source")'") do | stdin, stdout, wait_thr |
		stdin.puts(source)
		stdin.close
		stdout.read
	end
rescue => e
	STDERR.puts e
	nil
end

begin
	require 'rubygems'
	require 'bundler/setup'
rescue LoadError => e
	STDERR.puts e
	nil
end
Rmarkdown(source)
