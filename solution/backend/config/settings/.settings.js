module.exports.merged = require("@fearless/serverless-settings-helper").mergeSettings(
  __dirname,
  [
    "../../../../config/settings/.defaults.yml",
    "./.defaults.yml",
    "../../../../config/settings/${stage}.yml",
    "./${stage}.yml"
  ]
);
