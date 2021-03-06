import * as tf from '@tensorflow/tfjs'
import * as tfvis from '@tensorflow/tfjs-vis'

window.onload = () => {
  const xs = [1, 2, 3, 4]
  const ys = [1, 3, 5, 7]

  tfvis.render.scatterplot(
    {name: '線性回歸訓練集'},
    {values: xs.map((x,i)=>({x,y:ys[i]}))},
    {xAxisDomain: [0, 5], yAxisDomain: [0, 8]}
  )

  // sequential 創造連續模型
  const model = tf.sequential()
  // units神經元個數, loss 損失函數, optimizer 優化器
  model.add(tf.layers.dense({units:1, inputShape:[1]}))
  model.compile({loss: tf.losses.meanSquaredError, optimizer: tf.train.sgd(0.1)})
}
