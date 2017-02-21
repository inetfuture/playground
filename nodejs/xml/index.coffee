'use strict'

xml2js = require 'xml2js'

xml = '
<xml>
  <ToUserName ToUserNameAttr="haha" ToUserNameAttr2="haha2">
    <![CDATA[oC9AeszaRsNzRp6_iPPzBe9N3Byg]]>
  </ToUserName>
  <FromUserName>
    <![CDATA[gh_fe6b5195b243]]>
  </FromUserName>
  <CreateTime>1419251481</CreateTime>
  <MsgType>
    <![CDATA[text]]>
  </MsgType>
  <MsgType>
    <![CDATA[text]]>
  </MsgType>
  <Content ContentAttr="this is a attribute">
    <ContentType MsgTypeAttr="this is a attribute">
        <![CDATA[This is content type.]]>
    </ContentType>
    <ContentText MsgTypeAttr="this is a attribute">
        <![CDATA[This is content text.]]>
    </ContentText>
  </Content>
</xml>
'
obj = null
xml2js.parseString xml,
  trim: true
  async: false
  explicitArray: false
, (err, _obj) ->
  obj = _obj
  # {
  #   "xml": {
  #     "ToUserName": {
  #       "_": "oC9AeszaRsNzRp6_iPPzBe9N3Byg",
  #       "$": {
  #         "ToUserNameAttr": "haha",
  #         "ToUserNameAttr2": "haha2"
  #       }
  #     },
  #     "FromUserName": "gh_fe6b5195b243",
  #     "CreateTime": "1419251481",
  #     "MsgType": [
  #       "text",
  #       "text"
  #     ],
  #     "Content": {
  #       "$": {
  #         "ContentAttr": "this is a attribute"
  #       },
  #       "ContentType": {
  #         "_": "This is content type.",
  #         "$": {
  #           "MsgTypeAttr": "this is a attribute"
  #         }
  #       },
  #       "ContentText": {
  #         "_": "This is content text.",
  #         "$": {
  #           "MsgTypeAttr": "this is a attribute"
  #         }
  #       }
  #     }
  #   }
  # }
  console.log JSON.stringify(obj, null, 2)

xml = new xml2js.Builder({ headless: true }).buildObject obj
# <xml>
#   <ToUserName ToUserNameAttr="haha" ToUserNameAttr2="haha2">oC9AeszaRsNzRp6_iPPzBe9N3Byg</ToUserName>
#   <FromUserName>gh_fe6b5195b243</FromUserName>
#   <CreateTime>1419251481</CreateTime>
#   <MsgType>text</MsgType>
#   <MsgType>text</MsgType>
#   <Content ContentAttr="this is a attribute">
#     <ContentType MsgTypeAttr="this is a attribute">This is content type.</ContentType>
#     <ContentText MsgTypeAttr="this is a attribute">This is content text.</ContentText>
#   </Content>
# </xml>
console.log xml

obj.xml.ToUserName._ = '<![CDATA[oC9AeszaRsNzRp6_iPPzBe9N3Byg]]>'
xml = new xml2js.Builder({ headless: true }).buildObject obj
# <xml>
#   <ToUserName ToUserNameAttr="haha" ToUserNameAttr2="haha2">&lt;![CDATA[oC9AeszaRsNzRp6_iPPzBe9N3Byg]]&gt;</ToUserName>
#   <FromUserName>gh_fe6b5195b243</FromUserName>
#   <CreateTime>1419251481</CreateTime>
#   <MsgType>text</MsgType>
#   <MsgType>text</MsgType>
#   <Content ContentAttr="this is a attribute">
#     <ContentType MsgTypeAttr="this is a attribute">This is content type.</ContentType>
#     <ContentText MsgTypeAttr="this is a attribute">This is content text.</ContentText>
#   </Content>
# </xml>
console.log xml
