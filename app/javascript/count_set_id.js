function count (){
  const setId = document.getElementById("set-id")
  setId.addEventListener('click', () => {
    const countUpBtn = document.querySelectorAll(".count-up-btn")
    const countDownBtn = document.querySelectorAll(".count-down-btn")
    const countCalcBtn = document.querySelectorAll(".count-calc-btn")
    const detailNumber = document.querySelectorAll(".detail-number")
    const detailProbability = document.querySelectorAll(".detail-probability")
    let len = countUpBtn.length
    for (let i = 1; i <= len; i++){
      countUpBtn[i-1].setAttribute("id", `count-up-btn-${i-1}`),
      countDownBtn[i-1].setAttribute("id", `count-down-btn-${i-1}`),
      countCalcBtn[i-1].setAttribute("id", `count-calc-btn-${i-1}`),
      detailNumber[i-1].setAttribute("id", `detail-number-${i-1}`),
      detailProbability[i-1].setAttribute("id", `detail-probability-${i-1}`)

    }
  })
}

window.addEventListener('load',count)