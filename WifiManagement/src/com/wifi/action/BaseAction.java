package com.wifi.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sina.sae.storage.SaeStorage;
import com.sina.sae.util.SaeUserInfo;
import com.wifi.constance.LogicContance;
import com.wifi.daoimpl.UserDao;
import com.wifi.entity.User;

public abstract class BaseAction extends ActionSupport {

	private File fileUpload;
	private String fileUploadContentType;
	private String fileUploadFileName;

	protected User getSessionUser() {

		ActionContext ac = ActionContext.getContext();
		Map<String, Object> session = ac.getSession();
		return (User) session.get(LogicContance.SESSION_USER);
	}

	protected String saveFile() {

		String photoUrl = null;
		if (fileUpload != null) {
			System.out.println("开始上传！ 路径" + fileUpload.getPath());
			FileOutputStream fos = null;
			FileInputStream fis = null;
			try {
				// 上传存放的目录
				long time = System.currentTimeMillis();
				System.out.println("fileUploadFileName ：  " + fileUploadFileName);
				String[] fileSplits = fileUploadFileName.split("\\.");
				System.out.println("fileSplits：  " + Arrays.toString(fileSplits));
				String fileType = "";
				if (fileSplits.length >= 2) {
					fileType = fileSplits[fileSplits.length - 1];
				}
				System.out.println("fileType:  " + fileType);
				String realPath = SaeUserInfo.getSaeTmpPath() + "/";
				System.out.println("realPath:  " + realPath);
				String fileName = time + "." + fileType;
				System.out.println("fileName:  " + fileName);
				File uploadFile = new File(realPath, fileName);
				System.out.println("Fileupload  path   " + fileUpload.getPath());
				System.out.println("Fileupload  size   " + fileUpload.length());
				fis = new FileInputStream(fileUpload);
				fos = new FileOutputStream(uploadFile);
				byte[] buffer = new byte[1024];
				int len = 0;
				System.out.println("开始写入TmpPath");
				while ((len = fis.read(buffer)) > 0) {
					System.out.println("正在写入字节数" + len);
					fos.write(buffer, 0, len);
				}
				
				SaeStorage ss = new SaeStorage();
	            // 使用upload方法上传到域为image下
				System.out.println("上传到domain wifi   src ： "+ realPath + fileName + "  dest :" + fileName );
	            ss.upload("public", realPath + fileName, fileName);
	            photoUrl = ss.getUrl("public", fileName);
			} catch (FileNotFoundException e) {
				System.out.println("找不到文件！" + e.toString());
				e.printStackTrace();
				return INPUT;
			} catch (IOException e) {
				System.out.println("读入文件出错！" + e.toString());
				e.printStackTrace();
				return INPUT;
			} catch(Exception e) {
				System.out.println("其它错误！" + e.toString());
			}
			finally {
				try {
					if (fis != null) {
						fis.close();
					}
					if (fos != null) {
						fos.close();
					}
				} catch (IOException e) {
					System.out.println("关闭文件出错！");
					e.printStackTrace();
				}
			}
		}
		return photoUrl;
	}

	public File getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}

	public String getFileUploadContentType() {
		return fileUploadContentType;
	}

	public void setFileUploadContentType(String fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}

	public String getFileUploadFileName() {
		return fileUploadFileName;
	}

	public void setFileUploadFileName(String fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}

}
