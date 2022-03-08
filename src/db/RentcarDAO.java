package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RentcarDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	//Ŀ�ؼ� Ǯ�� �̿��� �����ͺ��̽� ����
	public void getCon(){
		
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//�ֽż� 3���� �ڵ����� �����ϴ� �޼ҵ�
	public Vector<CarListBean> getSelectCar(){
		//����Ÿ��
		Vector<CarListBean> v = new Vector<>();
		getCon();
		
		try {
			String sql = "SELECT * FROM (SELECT * FROM RENTCAR ORDER BY NO DESC)A WHERE ROWNUM < 4";	
			pstmt = con.prepareStatement(sql);
			//���� ���� �� ����� ResultŸ������ ����
			rs = pstmt.executeQuery();
			while(rs.next()){
				CarListBean bean = new CarListBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				//���Ϳ� �� Ŭ���� ����
				v.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	public Vector<CarListBean> getCategoryCar(int cate){
		Vector<CarListBean> v = new Vector<>();
		//�����͸� ������ �� Ŭ���� ����
		CarListBean bean = null;
		getCon();
		try {
			String sql = "SELECT * FROM RENTCAR WHERE CATEGORY=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, cate);
			rs=pstmt.executeQuery();
			while(rs.next()){
				bean = new CarListBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				//���Ϳ� �� Ŭ���� ����
				v.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	//��� ������ �˻��ϴ� �޼ҵ�
	public Vector<CarListBean> getAllCar(){
		Vector<CarListBean> v = new Vector<>();
		//�����͸� ������ �� Ŭ���� ����
		CarListBean bean = null;
		getCon();
		try {
			String sql = "SELECT * FROM RENTCAR";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				bean = new CarListBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				//���Ϳ� �� Ŭ���� ����
				v.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	// �ϳ��� �ڵ��� ������ �����ϴ� �޼ҵ�
	public CarListBean getOneCar(int num){
		CarListBean bean = new CarListBean();
		getCon();
		try {
			String sql = "SELECT * FROM RENTCAR WHERE NO = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bean;
	}

	public int getMember(String id, String pass){
		int result=0; //0�̸� ����
		getCon();
		
		try {
			String sql ="SELECT COUNT(*) FROM MEMBER WHERE ID=? AND PASS1=? ";
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs= pstmt.executeQuery();
			if(rs.next()){
				result=1;
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public void setReserveCar(CarReserveBean bean){
		getCon();
		
		try {
			String sql = "INSERT INTO CARRESERVE VALUES(RESERVE_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getNo());
			pstmt.setString(2, bean.getId());
			pstmt.setInt(3, bean.getQty());
			pstmt.setInt(4, bean.getDday());
			pstmt.setString(5, bean.getRday());
			pstmt.setInt(6, bean.getUsein());
			pstmt.setInt(7, bean.getUsewifi());
			pstmt.setInt(8, bean.getUseseat());
			pstmt.setInt(9, bean.getUsenavi());
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public Vector<CarViewBean>getAllReserve(String id){
		
		Vector<CarViewBean> v = new Vector<>();
		CarViewBean bean = null;
		
		getCon();
		
		try {
			
			String sql ="SELECT * FROM RENTCAR NATURAL JOIN CARRESERVE "
					+ "WHERE SYSDATE < TO_DATE(RDAY,'YYYY-MM-DD') AND ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				bean = new CarViewBean();
				bean.setName(rs.getString(2));
				bean.setPrice(rs.getInt(4));
				bean.setImg(rs.getString(7));
				bean.setQty(rs.getInt(11));
				bean.setDday(rs.getInt(12));
				bean.setRday(rs.getString(13));
				bean.setUsein(rs.getInt(14));
				bean.setUsewifi(rs.getInt(15));
				bean.setUseseat(rs.getInt(16));
				bean.setUsenavi(rs.getInt(17));
				v.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	public void carRemoveReserve(String id, String rday){
		getCon();
		
		try {
			String sql ="DELETE FROM CARRESERVE WHERE ID=? AND RDAY=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, rday);
			pstmt.executeUpdate();
			con.close();
			
		} catch (Exception e) {

			e.printStackTrace();
		}
		
	}
}
