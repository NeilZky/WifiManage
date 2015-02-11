package com.wifi.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wifi.dao.ICommonAreaConfigDao;
import com.wifi.daoimpl.CommonAreaConfigDao;
import com.wifi.daoimpl.CommonAreaDao;
import com.wifi.entity.CommonArea;
import com.wifi.entity.CommonAreaConfig;
import com.wifi.vo.BaseResult;

public class CommonAreaAction extends BaseAction{

	private static final long serialVersionUID = -4107075431274308061L;
	private CommonAreaConfig config;
	private List<CommonArea> datas;;
	private ICommonAreaConfigDao commonAreaConfigDao = new CommonAreaConfigDao();
	private CommonAreaDao dataDao = new CommonAreaDao();
	private boolean[] state;
	private ArrayList<Integer> deleteIDs;
	private int uid;

	public String commonArea() {

		int count = dataDao.getCount(uid);
		if(count == 0) {
			dataDao.copyFromReleaseTable(uid);
		}
		try {
			config = commonAreaConfigDao.getCommonAreaConfig(uid);
			if (config != null && !config.getColumnState().isEmpty()) {
				char[] charState = config.getColumnState().toCharArray();
				state = new boolean[charState.length];
				for (int i = 0; i < charState.length; i++) {
					if (charState[i] == '1') {
						state[i] = true;
					} else {
						state[i] = false;
					}
				}
			}
			datas = dataDao.getCommonAreas(uid);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	private BaseResult result;
 
	public String saveCommonAreaRelease() {
		
		dataDao.copyToReleaseTable(uid);
		return SUCCESS;
	}
	
	public String cancelCommonAreaRelease() {
		
		dataDao.copyFromReleaseTable(uid);
		return SUCCESS;
	}

	public String addCommonArea() {
		
		System.out.println("addCommonArea execute " + getFileUploadFileName() );
		String photoUrl = saveFile();;
		System.out.println("commonAreaAction photourl " + photoUrl);
		ca.setPhotoUrl(photoUrl);
		try {
			dataDao.insert(ca);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return INPUT;
		} catch (SQLException e) {
			e.printStackTrace();
			return INPUT;
		} catch (Exception e) {
			return INPUT;
		}
 		return SUCCESS;
	}

	public String updateCommonArea() {
		
		if(ca== null) {
			return INPUT;
		}
		String photoUrl = saveFile();;
//		if(fileUpload!=null){
//			System.out.println("开始上传！");
//			FileOutputStream fos=null;
//			FileInputStream fis=null;
//			try {
//				fis=new FileInputStream(fileUpload);
//				//上传存放的目录
//				String path = ServletActionContext.getServletContext().getRealPath("/");
//				long time = System.currentTimeMillis();
//				String[] fileSplits = fileUploadFileName.split("\\.");
//				String fileType = "";
//				if(fileSplits.length>=2) {
//					fileType = fileSplits[fileSplits.length - 1];
//				}
// 				File saveFolder = new File(path+"photo");
//				if(!saveFolder.exists()) {
//					saveFolder.mkdirs();
//				}
//				File saveFile = new File(saveFolder, time + "." + fileType);
//				photoUrl  = "photo/" + time+"." + fileType;
//				fos=new FileOutputStream(saveFile);
//				byte []b=new byte[1024];
//				while(fis.read(b)!=-1){
//					fos.write(b);
//					fos.flush();
//				}
//			} catch (FileNotFoundException e) {
//				System.out.println("找不到文件！");
//				e.printStackTrace();
//				return INPUT;
//			} catch (IOException e) {
//				System.out.println("读入文件出错！");
//				e.printStackTrace();
//				return INPUT;
//			}finally{
//				try {
//					if(fis!=null){fis.close();}
//					if(fos!=null){fos.close();}
//				} catch (IOException e) {
//					System.out.println("关闭文件出错！");
//					e.printStackTrace();
//					return INPUT;
//				}
//			}
//		}else{
//			return INPUT;
//		}
		ca.setPhotoUrl(photoUrl);
		try {
			dataDao.update(ca);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return INPUT;
		} catch (SQLException e) {
			e.printStackTrace();
			return INPUT;
		}

 		return SUCCESS;
	}
 
	public String deleteCommonAreas() {
		
		result = new BaseResult();
		boolean success = dataDao.delete(deleteIDs, "CommonArea");
		if (success) {
			result.setCode(BaseResult.CODE_SUCCESS);
			result.setUrl("commonArea.action");
		} else {
			result.setCode(BaseResult.CODE_FAILURE);
			result.setInfo("删除失败");
		}

		return SUCCESS;
	}
	
	public CommonAreaConfig getConfig() {
		return config;
	}

	public void setConfig(CommonAreaConfig config) {
		this.config = config;
	}

	public List<CommonArea> getDatas() {
		return datas;
	}

	public void setDatas(List<CommonArea> datas) {
		this.datas = datas;
	}

	public boolean[] getState() {
		return state;
	}

	public void setState(boolean[] state) {
		this.state = state;
	}

	private CommonArea ca;

	public CommonArea getCa() {
		return ca;
	}

	public void setCa(CommonArea ca) {
		this.ca = ca;
	}

	public ArrayList<Integer> getDeleteIDs() {
		return deleteIDs;
	}

	public void setDeleteIDs(ArrayList<Integer> deleteIDs) {
		this.deleteIDs = deleteIDs;
	}

	public BaseResult getResult() {
		return result;
	}

	public void setResult(BaseResult result) {
		this.result = result;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}
	
}
