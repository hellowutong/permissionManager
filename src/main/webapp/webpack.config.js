/**
 * 
 */
var webpack = require('webpack');
module.exports={
		//页面入口文件配置
		entry:__dirname+"/src/js/index.js", //"__driname"项目目录 唯一入库文件
		//入口文件输出配置
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
			//加载器配置
			loaders:[
			    //.css 文件使用 style-loader 和 css-loader 来处理
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
				},
				 //.js 文件使用 jsx-loader 来编译处理
				{
					test:/\.js$/,
					exclude:/node_modules/,//被排除的文件夹
					loader:'babel',
					query:{
						presets:['es2015','react']
					}

				}
			]
		},
		//插件项
		plugin:[
			new webpack.HotModuleReplacementPlugin()
		],
		 //其它解决方案配置
		resolve:{
			
		}
		
		
}