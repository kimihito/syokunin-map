class IndexController < ApplicationController
  def index
    @prefectures = Prefecture.all
    @prefcount={}
    Prefecture.all.each{|pref|
      @prefcount[pref.id]=pref.shokunins.active.count
    }
    max=@prefcount.values.max
    @prefcount.each{|key,value|
      @prefcount[key]=rgb [0xff,0xff,0xff],[0xff,0x00,0x00],value.fdiv(max)
    }
  end
  def rgb(cstart,cend,cval)
    color=3.times.map{|i|cstart[i]+(cend[i]-cstart[i])*cval}.map(&:to_i)
    "#%02x%02x%02x"%color
  end
end
