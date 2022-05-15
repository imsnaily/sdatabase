fx_version 'cerulean'
server_only 'yes'

game 'common'

author_plugin 'Snaily'
description 'The RocksDB library provides a persistent key value store. Keys and values are arbitrary byte arrays. The keys are ordered within the key value store according to a user-specified comparator function'
version '7.1.2'

shared_scripts {
    'shared.js'
}

server_script 'lib/database.js'