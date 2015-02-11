package com.wifi.action;

import java.io.File;

import com.opensymphony.xwork2.ActionSupport;

public class FileUploadAction extends ActionSupport{

	private static final long serialVersionUID = 7008736276812865186L;
	private File fileUpload;
	private String fileUploadContentType;
	private String fileUploadFileName;

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

	public File getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}

	public String execute() throws Exception{
		
		System.out.println(fileUpload);
		return SUCCESS;
		
	}
	
	public String display() {
		return NONE;
	}
	
}