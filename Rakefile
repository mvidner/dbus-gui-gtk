#! /usr/bin/env ruby
# frozen_string_literal: true

require "rake"
require "rubocop/rake_task"
require "yard"

desc "Default: run RuboCop"
task default: [:rubocop]

RuboCop::RakeTask.new
YARD::Rake::YardocTask.new
