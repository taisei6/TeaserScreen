# Teaser Screen
オンラインイベント等で頻繁に利用する待機画像を生成するためのアプリケーション．
  * シンプル
  * CPUリソースの消費をなるべく抑える
  * テキスト入力と時計機能を備える
  * 背景エフェクトを複数用意（pushしてほしい）

を設計指針として制作しています．effectを追加する場合は別途新規タブでeffectクラスを作成した後，TeaserScreen.pdeでsetup関数での初期化と，draw()関数内でのswitch分の追加を行ってください．

![teaser](images/WarmingGeometry.gif)
![teaser](images/NoiseLInes.gif)

# Requirement
  * Processing(>3.0)