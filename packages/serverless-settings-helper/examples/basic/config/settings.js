module.exports.merged = require('../../../src').mergeSettings(__dirname, [
  './sls-settings.defaults.yml', // load defaults first
  './sls-settings.${stage}.yml', // eslint-disable-line
]);
