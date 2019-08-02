package linksharing

class LinkResource extends Resource{
    String Linkurl

    static constraints = {
       Linkurl(blank:false,url:true,nullable:true)
    }

}
