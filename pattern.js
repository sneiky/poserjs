let $palist = null;
let $palica = 1;
let $div_h = null;
let $div_t = null;
let $div_square = null;
let $score = 0;
let $div_massage = null;
//
Array.prototype.shuffle = function () {
  return this.sort(function () {
    return 0.5 - Math.random();
  });
};
//
function create_button_bnext(
  div_square
) {
  let button_bnext = document.createElement('button');
  button_bnext.classList.add("bnext");
  button_bnext.addEventListener("click", press_button_bnext);
  button_bnext.innerHTML = "Дальше";
  //
  div_square.append(button_bnext);
}
//
function press_button_bnext(event) {
  let button = event.currentTarget;
  //
  $div_h.remove();
  $div_h = document.querySelector(".h");
  if ($div_h != null) {
    $div_h.style.display = "flex";
  }
  //
  $div_t.remove();
  $div_t = document.querySelector(".t");
  if ($div_t != null) {
    $div_t.style.display = "flex";
  }
  //
  $div_square.innerHTML = "";
  //
  if ($div_h != null) {
    convert_formula_to_interactive(
      $div_h,
      $div_t,
      $div_square,
      $div_massage
    );
  }
  //
}
//
function press_div_sq1(event) {
  let div = event.currentTarget;
  if (div.dataset.disunu == $palica) {
    let palist = $palist.slice(0);
    let slide = convert_palist_to_paslide(palist, $palica)
    let divh_len = document.querySelectorAll(".h").length;
    if ((divh_len != 1) || ((palist.length - 1) / 2 != $palica + 1)) {
      $div_h.innerHTML = "";
      $div_h.append(slide);
      MathJax.typeset();
      $palica++;
      div.style.display = "none";
      if ((palist.length - 1) / 2 == $palica) {
        $palica = 1;
        create_button_bnext($div_square);
      }
    } else {
      alert("jojo");
      $div_square.innerHTML = "";
      $div_h.innerHTML = "The End!";
      $div_t.innerHTML = "";
    }
  } else {
    $score += 1;
    //alert(div_massage.innerHTML);
    document.getElementById("score").innerHTML = $score;
  }
}
//
function convert_formula_to_interactive(
  div_h,
  div_t,
  div_square
) {
  $div_h = div_h;
  $div_t = div_t;
  $div_square = div_square;
  //create number-blocks in div_square
  let palist = convert_formula_to_palist(div_h.innerText);
  $palist = palist.slice(0);
  let nulist = convert_palist_to_nulist(palist);
  let divnulist = convert_nulist_to_divnulist(nulist);
  divnulist = divnulist.shuffle()
  append_divnulist(divnulist, div_square);
  //create first slide in div_h
  let slide0 = convert_palist_to_paslide(palist, $palica - 1)
  div_h.innerHTML = "";
  div_h.append(slide0);
  MathJax.typeset();
}
//
function convert_palist_to_paslide(
  palist,
  paslidenu
) {
  palistle = palist.length;
  palistfe = 1;
  paslidenuno = (paslidenu + 1) * 2 - 1;
  while (palistfe < palistle) {
    if (palistfe % 2 != 0) {
      if (palistfe < paslidenuno) {
        let hamoba = "\\fbox{\\({\\color{white}(}{\\color{black}";
        let hamoca = palist[palistfe];
        let hamoda = "}{\\color{white})}\\)}";
        palist[palistfe] = hamoba + hamoca + hamoda;
      } else if (palistfe == paslidenuno) {
        let hamoba = "\\fbox{\\({\\color{white}(}{\\color{black}";
        let hamoca = "\\circ";
        let hamoda = "}{\\color{white})}\\)}";
        palist[palistfe] = hamoba + hamoca + hamoda;
      } else if (palistfe > paslidenuno) {
        let hamoba = "\\fbox{\\({\\color{white}(}{\\color{white}";
        let hamoca = "\\circ";
        let hamoda = "}{\\color{white})}\\)}";
        palist[palistfe] = hamoba + hamoca + hamoda;
      }
    }
    palistfe++;
  }
  palist.unshift("\\[");
  palist.push("\\]");
  let paslidete = palist.join("");
  let paslide = document.createTextNode(paslidete);
  return (paslide);
}
//
function convert_formula_to_palist(
  formula
) {
  let poformula = formula.replace(/ /g, "");
  let palist = poformula.split("|");
  return (palist);
}
//
function convert_palist_to_nulist(
  palist
) {
  let nulist = [];
  let palistle = palist.length;
  let palistfe = 1;
  while (palistfe < palistle) {
    nulist.push(palist[palistfe]);
    palistfe = palistfe + 2;
  }
  return (nulist);
}
//
function convert_nulist_to_divnulist(
  nulist
) {
  let divnulist = [];
  let nulistle = nulist.length;
  let nulistfe = 0;
  while (nulistfe < nulistle) {
    divnulist.push(
      create_div_sq1(
        nulist[nulistfe],
        nulistfe + 1
      )
    );
    nulistfe++;
  }
  return (divnulist);
}
//
function create_div_sq1(
  formula,
  disunu
) {
  let inhata = "";
  inhata += "\\[";
  inhata += formula;
  inhata += "\\]";
  let div_sq1 = document.createElement('div');
  div_sq1.classList.add("sq1");
  div_sq1.dataset.disunu = disunu;
  div_sq1.addEventListener("click", press_div_sq1);
  div_sq1.innerHTML = inhata;
  return (div_sq1);
}
//
function append_divnulist(
  divnulist,
  div_square
) {
  let divnulistle = divnulist.length;
  let divnulistfe = 0;
  while (divnulistfe < divnulistle) {
    div_square.append(divnulist[divnulistfe]);
    divnulistfe++;
  }
}
//
function hide_excess_tanahas() {
  let has = document.querySelectorAll(".h");
  let tas = document.querySelectorAll(".t");
  let n = has.length;
  for (i = 1; i < n; i++) {
    has[i].style.display = "none";
    tas[i].style.display = "none";
  }
}
//
function get_pa_by_name(name, url = window.location.href) {
  name = name.replace(/[\[\]]/g, '\\$&');
  var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
    results = regex.exec(url);
  if (!results) return null;
  if (!results[2]) return '';
  return decodeURIComponent(results[2].replace(/\+/g, ' '));
}
//
function light_curala() {
  let theme = get_pa_by_name("theme");
  let se = null;
  if (theme == null) {
    se = 'a[href="/"]';
  } else {
    se = 'a[href="/?theme=' + theme + '"]';
  }
  let facurala = document.querySelectorAll(se);
  facurala.forEach(
    function (elem) { elem.className += ' curala' }
  );
}
//
function load_js() {
  let div_h = document.querySelector(".h");
  let div_t = document.querySelector(".t");
  let div_square = document.querySelector(".square");
  let div_massage = document.querySelector(".massage");
  light_curala();
  hide_excess_tanahas();
  convert_formula_to_interactive(div_h, div_t, div_square, div_massage);
}
//
document.addEventListener("DOMContentLoaded", load_js);
