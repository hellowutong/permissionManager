/**
 * 
 */
module.exports={
		entry:__dirname+"/src/js/test.js", //"__driname"项目目录 唯一入库文件
		output:{
			path:__dirname+"/assets/js",
			filename:"test.js",
			publicPatch:"/temp/"
		},
		devServer:{
			contentBase:"./",
			host:'127.0.0.1',
			port:'3333',
			color:true
		}
}