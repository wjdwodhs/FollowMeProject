package com.fz.followme.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fz.followme.dto.AttachmentDto;
import com.fz.followme.dto.EmailDto;
import com.fz.followme.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class EmailDao {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	
	
	
	public List<EmailDto> selectMemberList(){
		return sqlSessionTemplate.selectList("emailMapper.selectMemberList");
	}
	
	
	public void insertEmail(EmailDto ed) {
		sqlSessionTemplate.insert("emailMapper.insertEmail", ed);
	}
	
	public void insertReceiveEmail(EmailDto ed) {
		sqlSessionTemplate.insert("emailMapper.insertReceiveEmail", ed);
	}
	
	public void insertAttachment(AttachmentDto at) {
		sqlSessionTemplate.insert("emailMapper.insertAttachment", at);
	}
	
	public int selectOutBoxListCount() {
		return sqlSessionTemplate.selectOne("emailMapper.selectOutBoxListCount");
	}
	
	public List<EmailDto> selectOutBoxList(PageInfoDto pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSessionTemplate.selectList("emailMapper.selectOutBoxList", null, rowBounds);
	}
	
	public int updateMailStatusTrash(int[] checkMail) {
		return sqlSessionTemplate.update("emailMapper.updateMailStatusTrash", checkMail);
	}
	
	public EmailDto selectSendMail(int no) {
		return sqlSessionTemplate.selectOne("emailMapper.selectSendMail", no);
	}
	
	public int updateDetailMailTrash(int no) {
		return sqlSessionTemplate.update("emailMapper.updateDetailMailTrash", no);
	}
	
	public int selectInBoxListCount() {
		return sqlSessionTemplate.selectOne("emailMapper.selectInBoxListCount");
	}
	
	public List<EmailDto> selectInBoxList(PageInfoDto pi){

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSessionTemplate.selectList("emailMapper.selectInBoxList", null, rowBounds);
	}
	
	public int selectRecycleBinListCount() {
		return sqlSessionTemplate.selectOne("emailMapper.selectRecycleBinListCount");
	}
	
	public List<EmailDto> selectRecycelBinList(PageInfoDto pi){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSessionTemplate.selectList("emailMapper.selectRecycelBinList", null, rowBounds);
	}
	
	public int updateBackUpMails(String emailNo, String forder) {
		Map<String, Object> checkMails = new HashMap<>();
		checkMails.put("emailNo", emailNo);
		checkMails.put("forder", forder);
		
		return sqlSessionTemplate.update("emailMapper.updateBackUpMails", checkMails);
	}
	
	public int deleteAllMails() {
		return sqlSessionTemplate.delete("emailMapper.deleteAllMails");
	}

}
