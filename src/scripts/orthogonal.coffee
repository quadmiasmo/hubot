users = {}

module.exports = (robot) ->
    robot.hear /^(?:ci|hu)bot/i, (msg) ->
        if msg.message.user.name isnt robot.name
            respondIfScheduled msg

    robot.respond /(?:who (?:are the|is(?: on the)?)) orth(?:og?(?:onal)?)? (?:users|watching|(?:[a-z]+ )list)\??/i, (msg) ->
        count = 0
        
        for user, props of users
            count++
            percent = props.weighting * 10
            send msg, "#{props.alias}, with a #{percent}% chance of being orthogonized"

        if count is 0
            msg.send "There are currently no users in this room scheduled to receive orthogonisms."

    robot.hear /^(?:orth(?:og?(?:onal)?)?[:,]?)? add ([a-z]+) (?:(?:weight(?:ed|ing)?|at|@) )?(10|\d)\.?$/i, (msg) ->
        name = msg.match[1]
   
        if name is robot.name
            send msg, "Nice try #{msg.message.user.name}."
        else if users[name] is undefined
            users[name] = createUser name, msg.match[2]
        else
            send msg, "Never fear #{msg.message.user.name}, #{name} is already on the list and should expect to be hearing from me soon."

    robot.hear /^(?:orth(?:og?(?:onal)?)?[:,]?)? (?:remove|ignore) ([a-z]+)/i, (msg) ->
        name = msg.match[1]
        user = users[name]

        if user isnt undefined
            delete users[name]
            send msg, "Okay #{msg.message.user.name}, #{name} is exempt from further pestering."

    robot.hear /^(?:orth(?:og?(?:onal)?)?[:,]?)? update ([a-z]+) (?:weight(?:ed|ing)? )?(10|\d)\.?$/i, (msg) ->
        name = msg.match[1]
        user = users[name]

        if user isnt undefined
            user.updateWeighting msg.match[2]
        else
            send msg, "I'm sorry #{msg.message.user.name}, #{name} is not currently scheduled for orthogonal messages."

    robot.respond /orth(?:og?(?:onal)?)?[:,]? ([a-z]+) (?:changed to|begat|thinks to hide as|to) ([a-z]+)/i, (msg) ->
        was = msg.match[1]
        isnow = msg.match[2]
        user = users[was]

        if user isnt undefined
            delete users[was]
            users[isnow] = createUser isnow, 10
            send msg, "Thanks #{msg.message.user.name}. #{isnow} is in for a world of hurt."
        else
            send msg, "So. #{was} wasn't scheduled for any orthogonisms anyway."

    robot.respond /(?:belittle|insult|rebuke|ridicule|demolish|admonish|berate|smack(?: ?down)?) ([a-z]+)/i, (msg) ->
        trigger msg, "rebuke"

    robot.respond /orth(?:og?(?:onal)?)? (?:(?:to|for) )?([a-z]+)\.?$/i, (msg) ->
        trigger msg, "orthogonism"

createUser = (alias, weighting = 0) ->
    return new OrthogonalUser alias, weighting

send = (robotMessage, orthogonalMessage) ->
    robotMessage.send orthogonalMessage

trigger = (msg, triggerType) ->
    message = ""
    name = msg.match[1]

    if triggerType is "orthogonism"
        name = msg.message.user.name if name is "me"
        orthogonism = msg.random messages
        message = "#{name}. #{orthogonism}"
    else
        rebuke = msg.random rebukes
        message = rebuke.replace("\{0\}", name)

    send msg, message

respondIfScheduled = (msg) ->
    user = users[msg.message.user.name]

    if user isnt undefined and user.isOverdue()
        send msg, msg.random messages

class OrthogonalUser
    constructor: (alias, weighting = 0) ->
        @alias      = alias
        @weighting  = weighting
        
    updateWeighting: (weighting) ->
        @weighting = weighting

    isOverdue: ->
        random = Math.random() * 100
        likelihood = @weighting * 10
        return random <= likelihood

# Orthogonal sayings and such
messages = [
    "We all have something to bring to this discussion, and from now on what you should bring is silence."
    "This is orthogonal to the topic at hand."
    "You think you're the smartest person in the room. Unfortunately, I also believe I am the smartest person in the room. So, you see, we are at an impasse."
]
            
rebukes = [
    "{0}, you have a small mind."
    "You know {0}, I sometimes wonder why your parents bothered to feed you."
    "I've met some pretty interesting people over the years. {0} isn't one of them."
    "{0}, I've come to regard you as....a person I've met."
]

