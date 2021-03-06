class Something
  var _name: String
  let id: U64

  new create(id': U64, name': String) =>
    _name = name'
    id = id'

  fun name(): String => _name
  fun ref set_name(name': String) => _name = name'

actor Thing
  var _name: String
  let id: U64

  new create(id': U64, name': String) =>
    _name = name'
    id = id'

  be rename(name' :String) => _name = name'
  be introduce(env: Env) => env.out.print("Hi, I am " + _name)

actor Main
  new create(env: Env) =>
    let s = Something.create(1, "Brian")
    s.set_name("Eric")
    env.out.print("Hello " + s.name())

    let t = Thing.create(2, "Keith")
    t.rename("Ian")
    t.introduce(env)
