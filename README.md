# Backpacker
**Pack your data into a tiny backpack**

When you travel around the world, using poor internet connections shared with 42 hippies addicted to Instagram's stories, you value every bit you use. So, as a developer, you also value writing code that use less bandwith possible.

You heard about binary serialization and gzip, but binary serialization protocols are boring to learn, and gzip is something related with devops. And devops tend to ignore you. Or you are a one man army and you don't have any colleague.

## What the fuck is this library?

Backpacker is a moron-proof way to serialize data. Easy to learn, easy to explain, easy to implement. The kind of thing that backpackers love, because we want to turn off the computer and go to see butterflies in the forest.

## Give me an example, now!

Imagine that you have a structure in your code that represents a common person: what's his name, what's his birthday, and how much fingers he have:

```kotlin
data class Person(
        val name: String,
        val birthday: Date,
        val fingers: Int)
```

Noice. And now, how can you serialize it to bytes, to send to your server mates? Just putting your data into the backpack writing a converter like this:

```kotlin
class PersonBackpacker {
    fun toBytes(val person: Person): ByteArray {
        val data = BackpackData(
                string1 = person.name,
                date1 = person.birthday,
                int1 = person.fingers
        )
        return Backpacker().toBytes(data)
    }

    fun fromBytes(val bytes: ByteArray): Person {
        val data = Backpacker().fromBytes(bytes)
        return Person(
                name = data.string1,
                birthday = data.date1,
                fingers = data.int1
        )
    }
}
```

## What if I want to put two Strings instead of just one?
You can add up to 40 Strings, 20 Booleans, 20 Doubles, 20 Floats, 20 Integers and 20 Longs. They are named `string1`, `string2`, `string3`... As simple as all backpackers will understand it. In addition, you can also add a list of elements by free.

## What if I have a data structure with tons of data?
You will need some patience to write your custom `SomethingBackpacker`. At some point of the future we will bring a `BackpackerGenerator`, so you can just annotate the fields you want to serialize and your `SomethingBackpacker` will be autogenerated. But, right now, just get the patience. By the way, writing a proto file, compiling it to your language and wrapping it with your own code needs more patience than just writing your `SomethingBackpacker`.

## Ok! What's below the hood?
Protobuffers. We're not smart enough to write a whole serialization mechanism. So, we just wrote a `Backpacker` class that wraps all Protobuffers' magic.

## What languages are supported right now?
- Kotlin: get all the info you need at [Backpacker for Kotlin](https://github.com/backpack-serializers/backpacker-kotlin)
- Java: we have not written the examples yet, but in the meantime, try to understand the Kotlin ones

## Last question! Is this library working on any production application?
My god, no! We just pushed it to GitHub. This project is a RDD one. Yes: the `R` is for `Readme`.
