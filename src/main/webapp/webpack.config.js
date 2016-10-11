/**
 * 
 */
var webpack = require('webpack');
module.exports={
		entry:__dirname+"/src/js/index.js", //"__driname"项目目录 唯一入库文件
		output:{
			path:__dirname+"/assets/js",
			filename:'index.js',
			publicPath:'/temp/'
		},
		devServer:{
			contentBase:'./',
			host:'127.0.0.1',
			port:'3333',
			color:true
		},
		module:{
			loaders:[
				{
					test:/\.css$/,
					loader:'style-loader!css-loader'
				},
				{
					test:/\.less$/,
					loader:'style!css!less'
				},{
					test:'/\.json$/',
					loader:'json'
				},{
					test:/\.js$/,
					exclude:/node_modules/,//被排除的文件夹
					loader:'babel',
					query:{
						presets:['es2015','react']
					}

				}
			]
		},
		plugin:[
			new webpack.HotModuleReplacementPlugin()
		]
		
}