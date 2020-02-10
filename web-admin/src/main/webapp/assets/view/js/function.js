/**
 * Created by CoderQiang on 2017/5/12.
 */
function checkMobile(sMobile) {
    var pattern = /(^1(3[0-9]|4[5,7]|5[0-35-9]|8[0-9]|7[06-8])\d{8}$)/;
    if (pattern.test(sMobile)) {
        return true;
    }
    return false;
}

function isCardNo(card) {
    // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
    var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
    if (reg.test(card) === false) {
        return false;
    }
    return true;
}
function getISOYearWeek(date) {
    var commericalyear = getCommerialYear(date);
    var date2 = getYearFirstWeekDate(commericalyear);
    var day1 = date.getDay();
    if (day1 == 0) day1 = 7;
    var day2 = date2.getDay();
    if (day2 == 0) day2 = 7;
    var d = Math.round((date.getTime() - date2.getTime() + (day2 - day1) * (24 * 60 * 60 * 1000)) / 86400000);
    return Math.ceil(d / 7) + 1;
}

function getYearFirstWeekDate(commericalyear) {
    var yearfirstdaydate = new Date(commericalyear, 9, 2);
    var daynum = yearfirstdaydate.getDay();
    var monthday = yearfirstdaydate.getDate();
    if (daynum == 0) daynum = 7;
    if (daynum <= 4) {
        return new Date(yearfirstdaydate.getFullYear(), yearfirstdaydate.getMonth(), monthday + 1 - daynum);
    } else {
        return new Date(yearfirstdaydate.getFullYear(), yearfirstdaydate.getMonth(), monthday + 8 - daynum)
    }
}

function getCommerialYear(date) {
    var daynum = date.getDay();
    var monthday = date.getDate();
    if (daynum == 0) daynum = 7;
    var thisthurdaydate = new Date(date.getFullYear(), date.getMonth(), monthday + 4 - daynum);
    return thisthurdaydate.getFullYear();
}

function getBirthdatByIdNo(iIdNo) {
    var tmpStr = "";
    var idDate = "";
    var tmpInt = 0;
    var strReturn = "";

    iIdNo = iIdNo.trim();

    if ((iIdNo.length != 15) && (iIdNo.length != 18)) {
        strReturn = "输入的身份证号位数错误";
        return strReturn;
    }

    if (iIdNo.length == 15) {
        tmpStr = iIdNo.substring(6, 12);
        tmpStr = "19" + tmpStr;
        tmpStr = tmpStr.substring(0, 4) + "-" + tmpStr.substring(4, 6) + "-" + tmpStr.substring(6);

        return tmpStr;
    }
    else {
        tmpStr = iIdNo.substring(6, 14);
        tmpStr = tmpStr.substring(0, 4) + "-" + tmpStr.substring(4, 6) + "-" + tmpStr.substring(6);

        return tmpStr;
    }
}
function getSexByIdcardo(idcardo) {
    if (parseInt(idcardo.substr(16, 1)) % 2 == 1) {
//男
        return "1";
    } else {
//女
        return "2";
    }
}

function isIE() { //ie?
    if (!!window.ActiveXObject || "ActiveXObject" in window)
        return true;
    else
        return false;
}



