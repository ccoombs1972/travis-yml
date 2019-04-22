# frozen_string_literal: true
require 'travis/yml/schema/dsl/map'

module Travis
  module Yml
    module Schema
      module Def
        module Addon
          class Addon < Dsl::Map
            def define
              namespace :addon
              normal
              change :enable
              export
            end
          end
        end

        class Addons < Dsl::Map
          registry :addons
          register :addons

          def define
            map :apt,             to: :apt
            map :apt_packages,    to: :seq
            map :browserstack,    to: :browserstack
            map :artifacts,       to: :artifacts
            map :code_climate,    to: :code_climate
            map :coverity_scan,   to: :coverity_scan
            map :homebrew,        to: :homebrew
            map :hostname,        to: :str
            map :hosts,           to: :seq
            map :jwt,             to: :jwts
            map :sauce_connect,   to: :sauce_connect
            map :snaps,           to: :snaps
            map :ssh_known_hosts, to: :seq

            type = Class.new(Dsl::Any) do
              def define
                add :map,  normal: true, strict: false
                add :bool, normal: true
              end
            end

            map :sonarqube,       to: type
            map :srcclr,          to: type
            map :firefox,         to: :str
            map :mariadb,         to: :str
            map :postgresql,      to: :str, alias: :postgres
            map :rethinkdb,       to: :str
            map :deploy,          to: :deploys

            export
          end
        end
      end
    end
  end
end

require 'travis/yml/schema/def/addon/apt'
require 'travis/yml/schema/def/addon/artifacts'
require 'travis/yml/schema/def/addon/browserstack'
require 'travis/yml/schema/def/addon/code_climate'
require 'travis/yml/schema/def/addon/coverity_scan'
require 'travis/yml/schema/def/addon/homebrew'
require 'travis/yml/schema/def/addon/jwts'
require 'travis/yml/schema/def/addon/sauce_connect'
require 'travis/yml/schema/def/addon/snaps'
