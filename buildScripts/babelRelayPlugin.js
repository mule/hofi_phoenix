const getBabelRelayPlugin = require('babel-relay-plugin');
const schema = require('../web/graphQlSchemas/schema.json');

module.exports = getBabelRelayPlugin(schema.data);