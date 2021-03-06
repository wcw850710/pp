`
什麼是神經網絡(人工)
  是一種運算模型(就是輸入輸出的映射)，由大量的節點(或稱神經元)之間相互連接構成
  
  每個神經元裡存儲若干"權重(weight)、偏差變量(bias)、激活函數(activation 用於添加一些非線性變換)"
  神經元做的事：回上一層輸入>乘上權重相加>乘上偏值相加>經激活函數再算>輸出(輸入乘上權重加上偏置，經過激活函數得到輸出)

神經網絡層

拿相親舉例
  輸入層通常不會用於計算神經網路的層數，所以以下只有兩層，隱藏層通常有多個
  神經網絡通常包括一個"輸入層"、若干"隱藏層"、一個"輸出層"
  ---
  五官     形象     滿意程度
  身材     財富
  學歷     品質
  家境     有趣
  (輸入層) (隱藏層) (輸出層)
  
  
---


什麼是神經網絡訓練
  給大量輸入和輸出，算出神經網絡裡所有神經元的權重、偏置、然後給定新的輸入，可以算出新的輸出
  在機器學習裡輸入輸出被稱為"特性"和"標籤"，大量輸入輸出被稱為訓練集
  
如何訓練？
  初始化：隨機生成一些權重和偏置
  計算損失：給定特徵，計算出標籤，得到他與真實標籤差的多遠
  優化：微調權重和偏置，使損失變小
  
前向傳播與反向傳播
  前向傳播：將訓練數據的特徵送入網絡，得到標籤
  反向傳播：計算損失並優化

如何計算損失
  使用"損失函數"(均方誤差、對數損失、交叉熵...)
  
如何優化
  使用"優化器"(隨機梯度下降(SGD)、Adam...)
  

---


Tensorflow.js 是什麼
  js實現的機器學習庫
  可以在瀏覽器和nodejs中使用機器學習
  功能：
    運行現有模型
    重新訓練現有模型
    使用js開發機器學習模型

安裝
  瀏覽器
    1.script
    
  nodejs


---


什麼是tensor(張量)
  張量是向量和矩陣向更高維度的推廣
  相當於多維數組
  
tensor和機器學習有什麼關係
  神經網絡是什麼樣子？
  如果讓你設計神經網絡結構，你會怎麼設計？
  
神經網絡結構設計
  神經網絡每層都要儲存N維數據
  N層For循環運算
  Tensor作為高維數據結構完美解決以上問題
  
  
---


什麼是線性回歸
  利用數理統計中回歸分析，來確定兩種或兩種以上變量相互依賴的定量關係的一種統計分法
  eg 身高體重預測、房價預測
  
操作步驟
  準備可視化訓練數據
  使用Tensorflow.js的API來構建神經網絡
  訓練模型並預測
  
  
---


定義模型結構(單層單個神經元組成的神經網絡)
操作步驟
  初始化一個神經網絡模型
  為神經網絡模型添加層
  設計層的神經元個數和inputShape
  
  
---


損失函數：均方誤差(MSE)
  用來修正AI的預測錯誤(全數平方(或絕對值)相加除總)

操作步驟
  跟著Google機器學習速成教程理解(https://developers.google.com/machine-learning/crash-course/descending-into-ml/training-and-loss?hl=zh-cn)
  在tensorflow.js中設置損失函數
  
  
---


優化器：隨機梯度下降(SGD)
  可以通過優化器找到改進的"方向"及"幅度"
  
操作步驟
  跟著Google機器學習速成教程理解(https://developers.google.com/machine-learning/crash-course/reducing-loss/an-iterative-approach?hl=zh-cn)
  在tensorflow.js中設置優化器
`
















