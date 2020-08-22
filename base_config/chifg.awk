#!/usr/bin/gawk -f
# 1234567890 壹贰叁肆伍陆柒捌玖零
# 说明：单位以“亿亿”表示10的16次方，而“亿亿亿”表示
# 10的24次方，依此类推


# 自定义函数setunits()：为数字增加中文单位
# setunits(起始位，结束位，亿的个数， ...局部变量)
# 一般以8 个为一个单位
func setunits(off1,off2,state,   i,j){
    for(i=off2;i>=off1;i--) {
	if (off2-i==4) $i=$i "万"
	else if($i!="0") $i=$i p[(off2-i)%4]
    }
    # 每8位state就增加1，用来控制单位中“亿”的个数。
    j=state; while(j--) $off2=$off2 "亿"
    # 退出条件
    if (off1==1) return
    else if (off1<=9) setunits(1,off1-1,++state)
    else setunits(off1-8,off1-1,++state)
}


# 自定义函数conv_num()：将数字转换为中文
# 定义局部变量i
func conv_num(  i){
    # 注意下面替换的顺序
    sub(/0*\./,"点")
    # 清除连续的0
    gsub(/0000万0000[亿]+/,"")
    gsub(/0000万/,"")
    gsub(/0+亿/,"亿")
    gsub(/0+万/,"万")
    gsub(/0+/,"0")
    sub(/^[亿万]+/,"")
    #清除首尾的0
    sub(/^00*/,"")
    sub(/00*$/,"")
    sub(/^$/,"零")
    sub(/^点/,"零点")
    # 替换阿拉伯数字为中文
    for(i in a) gsub(i-1,a[i])
}


# 主程序体 -------------------------
# 设置栏位的输入和输出的分隔符为空字串
BEGIN{  FS=OFS=""
    split("拾,佰,仟,万",p,",")
    split("零,壹,贰,叁,肆,伍,陆,柒,捌,玖",a,",")
}


{ gsub(/,/,"") } #允许输入 123,456.789 的形式


		 # 验证输入。这里没有对多个小数点进行验证。
/^[-0-9][0-9.]*$/{


    # 判断正负
    isNeg=(sub(/^-/,""))


    # 小数点前的数字进行单位设置
    if (dotpos=index($0,".")) {
	of2=dotpos-1
	for (i=of2+2;i<=NF;i++) $i=a[$i+1]
    }else of2=NF
    if (of2>8) setunits(of2-7,of2,0)
    else setunits(1,of2,0)


    # 阿拉伯数字转为中文数字
    conv_num()


    # 还原正负号
    if (isNeg && $0!="零") print "负" $0
    else print
}


# 程序结束 -------------------------
