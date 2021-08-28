let $palist = null;
let $palica = 1;
let $div_h = null;
//
Array.prototype.shuffle = function() {
    return this.sort(function() {
        return 0.5 - Math.random();
    });
};
//
function press_div_sq1(event)
{
  let div = event.currentTarget;
  if(div.dataset.disunu == $palica) {
    let palist = $palist.slice(0);
    let slide = convert_palist_to_paslide(palist, $palica)
    $div_h.innerHTML = "";
    $div_h.append(slide);
    MathJax.typeset();
    $palica++;
    div.style.display = "none";
  }
}
//
function convert_formula_to_interactive(
                                        div_h,
                                        div_square
                                       )
{
  $div_h = div_h;
  //create number-blocks in div_square
  let palist = convert_formula_to_palist(div_h.innerText);
  $palist = palist.slice(0);
  let nulist = convert_palist_to_nulist(palist);
  let divnulist = convert_nulist_to_divnulist(nulist);
  divnulist = divnulist.shuffle()
  append_divnulist(divnulist, div_square);
  //create first slide in div_h
  let slide0 = convert_palist_to_paslide(palist, $palica-1)
  div_h.innerHTML = "";
  div_h.append(slide0);
}
//
function convert_palist_to_paslide(
                                    palist,
                                    paslidenu
                                   )
{
  palistle = palist.length;
  palistfe = 1;
  paslidenuno = (paslidenu+1)*2-1;
  while(palistfe < palistle) {
    if(palistfe % 2 != 0) {
      if(palistfe < paslidenuno) {
        let hamoba = "\\fbox{\\({\\color{white}(}{\\color{black}";
        let hamoca = palist[palistfe];
        let hamoda = "}{\\color{white})}\\)}";
        palist[palistfe] = hamoba+hamoca+hamoda;
      } else if(palistfe == paslidenuno) {
        let hamoba = "\\fbox{\\({\\color{white}(}{\\color{black}";
        let hamoca = "\\circ";
        let hamoda = "}{\\color{white})}\\)}";
        palist[palistfe] = hamoba+hamoca+hamoda;
      } else if(palistfe > paslidenuno) {
        let hamoba = "\\fbox{\\({\\color{white}(}{\\color{white}";
        let hamoca = "\\circ";
        let hamoda = "}{\\color{white})}\\)}";
        palist[palistfe] = hamoba+hamoca+hamoda;
      }
    }
    palistfe++;
  }
  palist.unshift("\\[");
  palist.push("\\]");
  let paslidete = palist.join("");
  let paslide = document.createTextNode(paslidete);
  return(paslide);
}
//
function convert_formula_to_palist(
                                   formula
                                  )
{
  let poformula = formula.replace(/ /g, "");
  let palist = poformula.split("|");
  return(palist);
}
//
function convert_palist_to_nulist(
                                  palist
                                 )
{
  let nulist = [];
  let palistle = palist.length;
  let palistfe = 1;
  while(palistfe < palistle) {
    nulist.push(palist[palistfe]);
    palistfe = palistfe + 2;
  }
  return(nulist);
}
//
function convert_nulist_to_divnulist(
                                     nulist
                                    )
{
  let divnulist = [];
  let nulistle = nulist.length;
  let nulistfe = 0;
  while(nulistfe < nulistle) {
    divnulist.push(
                   create_div_sq1(
                                  nulist[nulistfe],
                                  nulistfe+1
                                 )
                  );
    nulistfe++;
  }
  return(divnulist);
}
//
function create_div_sq1(
                        formula,
                        disunu
                       )
{
  let inhata = "";
  inhata += "\\[";
  inhata += formula;
  inhata += "\\]";
  let div_sq1 = document.createElement('div');
  div_sq1.classList.add("sq1");
  div_sq1.dataset.disunu = disunu;
  div_sq1.addEventListener("click", press_div_sq1);
  div_sq1.innerHTML = inhata;
  return(div_sq1);
}
//
function append_divnulist(
                          divnulist,
                          div_square
                         )
{
  let divnulistle = divnulist.length;
  let divnulistfe = 0;
  while(divnulistfe < divnulistle) {
    div_square.append(divnulist[divnulistfe]);
    divnulistfe++;
  }
}
//
function load_js()
{
  let div_h = document.querySelector(".h");
  let div_square = document.querySelector(".square");
  convert_formula_to_interactive(div_h, div_square);
}
//
document.addEventListener("DOMContentLoaded", load_js);
