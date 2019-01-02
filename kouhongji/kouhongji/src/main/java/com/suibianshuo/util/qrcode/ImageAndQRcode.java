//package com.suibianshuo.util.qrcode;
//
//import java.awt.AlphaComposite;
//import java.awt.Graphics2D;
//import java.awt.image.BufferedImage;
//import java.io.File;
//import java.io.IOException;
//import java.util.Hashtable;
//
//import javax.imageio.ImageIO;
//import javax.servlet.http.HttpSession;
//
//import com.google.zxing.BarcodeFormat;
//import com.google.zxing.EncodeHintType;
//import com.google.zxing.MultiFormatWriter;
//import com.google.zxing.common.BitMatrix;
//
//public class ImageAndQRcode {
//	 private static final int BLACK = 0xFF000000;
//	 private static final int WHITE = 0xFFFFFFFF;
//	 
//	 public ImageAndQRcode() {
//
//	 }
//	 
//	 private static BufferedImage toBufferedImage(BitMatrix matrix) {
//		int width =matrix.getWidth();
//		int height =matrix.getHeight();
//		BufferedImage image = new BufferedImage(width, height,
//		BufferedImage.TYPE_INT_RGB);
//		for (int x = 0; x < width; x++) {
//			for (int y = 0; y < height; y++) {
//				image.setRGB(x,y, matrix.get(x,y) ? BLACK :WHITE);
//			}
//		}
//		return image;
//	}
//	 
//	 private static void writeToFile(BitMatrix matrix, String format, File file)throws IOException {
//		BufferedImage image = toBufferedImage(matrix);
//		if (!ImageIO.write(image,format, file)) {
//		throw new IOException("Could not write an image of format "+ format + " to " + file);
//		}
//
//	 }
//	 
// 	/**
//      * @Title: 构造图片
//      * @Description: 生成水印并返回java.awt.image.BufferedImage
//      * @param file源文件(图片)
//      * @param waterFile水印文件(图片)
//      * @param x距离右下角的X偏移量
//      * @param y 距离右下角的Y偏移量
//      * @param alpha 透明度, 选择值从0.0~1.0: 完全透明~完全不透明
//      * @return BufferedImage
//      * @throws IOException
//      */
//	 private static BufferedImage watermark(File file, File waterFile,int x, int y, float alpha) throws IOException {
//		// 获取底图
//		BufferedImage buffImg = ImageIO.read(file);
//		// 获取层图
//		BufferedImage waterImg = ImageIO.read(waterFile);
//		// 创建Graphics2D对象，用在底图对象上绘图
//		Graphics2D g2d = buffImg.createGraphics();
//		int waterImgWidth =waterImg.getWidth();// 获取层图的宽度
//		int waterImgHeight =waterImg.getHeight();// 获取层图的高度
//		// 在图形和图像中实现混合和透明效果
//		g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP,alpha));
//		// 绘制
//		g2d.drawImage(waterImg,x, y, waterImgWidth, waterImgHeight,null);
//		g2d.dispose();// 释放图形上下文使用的系统资源
//		return buffImg;
//	 }
//	 
//	 
// 	/**
//      * 输出水印图片
//      * 
//      * @param buffImg 图像加水印之后的BufferedImage对象
//      * @param savePath 图像加水印之后的保存路径
//      */
// 	private void generateWaterFile(BufferedImage buffImg, String savePath) {
//		int temp =savePath.lastIndexOf(".") + 1;
//		try {
//			ImageIO.write(buffImg, savePath.substring(temp), new File(savePath));
//		} catch (IOException e1) {
//			e1.printStackTrace();
//		}
//	}
//	 
// 	/**
//      * 
//      * @param text 二维码内容
//      * @param width 二维码图片宽度
//      * @param height 二维码图片高度
//      * @param format 二维码的图片格式
//      * @param sourceFilePath 底层图片路径
//      * @param waterFilePath 二维码路径
//      * @param saveFilePath 合成图片路径
//      * @param maginx  二维码距离底图x轴距离
//      * @param maginy  二维码距离底图y轴距离
//      * @throws Exception
//      */
//	public void addImageQRcode(String text,int width,int height,String format,String sourceFilePath,String waterFilePath, String saveFilePath,int maginx,int maginy)throws Exception{
//		Hashtable<EncodeHintType, String> hints = new Hashtable<EncodeHintType, String>();
//		hints.put(EncodeHintType.CHARACTER_SET,"utf-8"); // 内容所使用字符集编码
//		BitMatrix bitMatrix =new MultiFormatWriter().encode(text,
//		BarcodeFormat.QR_CODE,width, height,hints);
//		// 生成二维码
//		File outputFile = new File("/Users/chenfenqian/Desktop" + File.separator +"new.jpg");
//		ImageAndQRcode.writeToFile(bitMatrix,format, outputFile);
//		ImageAndQRcode newImageUtils = new ImageAndQRcode();
//		// 构建叠加层
//		BufferedImage buffImg = ImageAndQRcode.watermark(new File(sourceFilePath),new File(waterFilePath),maginx, maginy, 1.0f);
//		// 输出水印图片
//		newImageUtils.generateWaterFile(buffImg,saveFilePath);
//	}
//		
//		
//	public static void main(String[] args) throws IOException {
//		ImageAndQRcode add = new ImageAndQRcode();
//		HttpSession session = null;
//		String path = session.getServletContext().getRealPath("/") + "resource/img/14c19dd2-072d-42b8-99a4-c964be412a69.jpg";
//		String path2 = session.getServletContext().getRealPath("/") + "resource/img/CircleCenter_1.png";
//		try {
//			add.addImageQRcode("http://www.baidu.com", 300, 300,"jpg", path,
//					path2,session.getServletContext().getRealPath("/")+"resource/img/aaa.png",780,1620);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
//	 
//}
