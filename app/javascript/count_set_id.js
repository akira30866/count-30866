function count (){
  const trialsUp = document.getElementById("trial-up-btn")
  const trialsDown = document.getElementById("trial-down-btn")
    // trialsの増減ボタンに関する記述
    trialsUp.addEventListener('click', () => {
      let trialUp = document.getElementById("trials")
      trialUp.value = parseInt(trialUp.value) + 1
    })
    trialsDown.addEventListener('click', () => {
      let trialDown = document.getElementById("trials")
      trialDown.value = parseInt(trialDown.value) - 1
    })

  const setFunction = document.getElementById("set-id")
  setFunction.addEventListener('click', () => {
    const countUpBtn = document.querySelectorAll(".count-up-btn")
    const countDownBtn = document.querySelectorAll(".count-down-btn")
    const countCalcBtn = document.querySelectorAll(".count-calc-btn")
    const detailNumber = document.querySelectorAll(".detail-number")
    const detailProbability = document.querySelectorAll(".detail-probability")
    const setTrials = document.getElementById("trials").value
    let len = countUpBtn.length
    // 試行回数に値がセットされていない場合に0をセットする
    if (!setTrials){
      const setTrialsNumber = document.getElementById("trials")
      setTrialsNumber.value = 0
    }

    // 回数に値がセットされていない場合に0をセットする
    for(let i = 1; i <= len; i++){
      if (!detailNumber[i-1].value){
        detailNumber[i-1].value = 0
      }
    }

    // フォーム内での計算を行う部分
    for (let j = 1; j <= len; j++){
      if (countUpBtn[j-1].getAttribute("id") != `count-up-btn-${j-1}`){
        // countUp用
        countUpBtn[j-1].addEventListener('click',() => {
          detailNumber[j-1].value = parseInt(detailNumber[j-1].value) + 1
        }) 
        // countDown用
        countDownBtn[j-1].addEventListener('click', () => {
          detailNumber[j-1].value = parseInt(detailNumber[j-1].value) - 1
        })
        // 確率計算用
        countCalcBtn[j-1].addEventListener('click', () => {
          let trialsNum = document.getElementById("trials").value
          if (trialsNum > 0){
            detailProbability[j-1].value = detailNumber[j-1].value*100/trialsNum
          }
        })
      }
    } // ここまで繰り返し処理(idを持たないものだけ関数をセットする)

    // 関数を作成するかどうかの識別用IDをセットする部分
    for (let k = 1; k <= len; k++){
      countUpBtn[k-1].setAttribute("id", `count-up-btn-${k-1}`)
    } //ここまで繰り返し処理
  })
}

window.addEventListener('load',count)