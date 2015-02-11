package com.wifi.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sina.sae.storage.SaeStorage;
import com.wifi.constance.LogicContance;
import com.wifi.daoimpl.UserDao;
import com.wifi.entity.User;

public abstract class CopyOfBaseAction extends ActionSupport{
	
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
		if ( fileUpload != null) {
			System.out.println("开始上传！");
			FileOutputStream fos = null;
			FileInputStream fis = null;
			try {
				fis = new FileInputStream(fileUpload);
				// 上传存放的目录
				String path = ServletActionContext.getServletContext()
						.getRealPath("/");
				long time = System.currentTimeMillis();
				String[] fileSplits = fileUploadFileName.split("\\.");
				String fileType = "";
				if (fileSplits.length >= 2) {
					fileType = fileSplits[fileSplits.length - 1];
				}
				File saveFolder = new File(path + "photo");
				if (!saveFolder.exists()) {
					saveFolder.mkdirs();
				}
				File saveFile = new File(saveFolder, time + "." + fileType);
				photoUrl = "photo/" + time + "." + fileType;
				fos = new FileOutputStream(saveFile);
				byte[] b = new byte[1024];
				while (fis.read(b) != -1) {
					fos.write(b);
					fos.flush();
				}
			} catch (FileNotFoundException e) {
				System.out.println("找不到文件！");
				e.printStackTrace();
				return INPUT;
			} catch (IOException e) {
				System.out.println("读入文件出错！");
				e.printStackTrace();
				return INPUT;
			} finally {
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
