resolveModule = (identifier, separator) ->
  separator ?= ':'
  attributeIndex = identifier.lastIndexOf separator

  if attributeIndex > -1
    attributeName = identifier[attributeIndex+1..]
    identifier = identifier[..attributeIndex-1]

  module = require identifier
  return module unless attributeName?

  attribute = module[attributeName]
  return attribute


adaptToCallback = (promise, callback) ->
  promise.then (result) -> callback null, result
  promise.catch (err) -> callback err


module.exports = {
  resolveModule
  adaptToCallback
}