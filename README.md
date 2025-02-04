# ascii_cat

Cute ASCII cat app 🐈‍⬛

// Add demo

Sound on 🎵

After seeing Adélaïde Sky's [post](https://x.com/adelen_sky/status/1881077766604640690) in x I decided to make a similar implementation on Flutter. The second reason and purpose for the creation is to practice working with [Riverpod](https://riverpod.dev).

You cat find this cat [here](https://emojicombos.com/cat).
```
 ╱|、
(˚ˎ 。7
 l、˜〵
 じしˍˍ)ノ
```

Code version

```dart
Text(
  isTailMoving
      ? ' ╱|、\n(˚ˎ 。7\n l、˜〵\n じしˍˍ)ノ'
      : ' ╱|、\n(˚ˎ 。7\n l、˜〵\n じしˍˍ)︵',
  style: TextStyle(fontSize: 30, fontFamily: 'Fira Code'),
),
```
- In order for the characters to be of the same style, I chose the [Fira Code font](https://fonts.google.com/specimen/Fira+Code).

- [Sound link](https://pixabay.com/sound-effects/search/purring/)

You can also experiment with cats from [here](https://2ch-aa.blogspot.com/2018/06/625.html).