# HTML5プレゼンテーション生成ツール

## 概要

Googleの`html5slides`を使ってプレゼンテーションを作成するためのツール。  
markdown形式で書いて簡単にスライドを作りたかったので作成した。

## 準備

rubyのmarkdownパーサを使っているので事前にインストールしておく。

```
% gem install kramdown
```

## 使い方

1. markdown形式でスライドの中身を作成する。  
    markdown内に`!slide`と記載することで新しいスライドを開始する。  
    `!slide クラス名`と記載することでスライドのスタイルを適用させることもできる。  
    kramdownは通常のmarkdownを拡張したタグの記載が可能になっており、タグに属性を付与する記法も用意されている。  
    html5slidesで使用できるスタイル及び、kramdownの記法の詳細は各ページ参照。
    * [html5slides](http://code.google.com/p/html5slides/)
    * [kramdown](http://kramdown.rubyforge.org/quickref.html)
    * [サンプル](/m-nori/html5slide_creater/raw/master/tools/test.md)
2. 以下のコマンドを実行してスライドのデータ(data/slides.json)を生成する。

```
% ruby tools/data_create.rb markdownファイル
```

#### index.htmlをブラウザで開くとslides.jsonがスライドに反映されていはず。

