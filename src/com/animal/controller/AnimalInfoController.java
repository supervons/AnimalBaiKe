package com.animal.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.animal.model.AnimalInfo;
import com.animal.model.CodeInfo;
import com.animal.model.Login;
import com.animal.model.SeachRecord;
import com.animal.model.UserInfo;
import com.animal.service.AnimalInfoService;
import com.animal.service.LoginService;
import com.animal.service.CodeInfoService;
import com.animal.service.SeachRecordService;
import com.animal.service.UserInfoService;
import com.animal.tools.CommonUtils;
import com.animal.tools.GetStandardTime;
import com.animal.tools.SendCodeUtil;
/**
 * 动物信息相关类
 * @author Administrator
 *
 */
@Controller
@RequestMapping("AnimalController")
public class AnimalInfoController {
	@Autowired
	private AnimalInfoService animalInfoService;	

	@Autowired
	private SeachRecordService seachRecordService;	
	Logger logger = LogManager.getLogger(SendCodeUtil.class.getName());
	
	@RequestMapping(value="seachAnimal",method=RequestMethod.POST)
    public String seachAnimal(Model model, HttpSession session,HttpServletRequest ss) {
		String seachWord = ss.getParameter("seachWord");
		AnimalInfo animalInfo = new AnimalInfo();
		ArrayList<AnimalInfo> listAnimalInfo = new ArrayList<AnimalInfo>();
		if(!seachWord.equals("")){
			listAnimalInfo = animalInfoService.seachAnimalByWords(seachWord);
		}else{
			listAnimalInfo = null;
		}
        if (listAnimalInfo != null && listAnimalInfo.size()>0) {//搜索的内容不为空，且有搜索结果，才计入搜索记录表
            session.setAttribute("listAnimalInfo", listAnimalInfo);
            //如果搜索的有结果，则证明该搜索有效，进入搜索记录表
            SeachRecord seachRecord = new SeachRecord();
            /**从session中获取用户id**/
            Login userLoginInfo = (Login)session.getAttribute("loginsession");
            String userId = userLoginInfo==null?"":userLoginInfo.getUserId();
            /**插入搜索记录表**/
            seachRecord.setRecordId(CommonUtils.getUUID());
            seachRecord.setUserId(userId);
            seachRecord.setSeachContent(seachWord);
            seachRecord.setSeachTime(new Date());
            seachRecordService.addNewSeachRecord(seachRecord);
    		logger.info(listAnimalInfo.toString());//日志级别为info则输出
    		return "public/discoveranimal";
        } else {
    		return "public/discoveranimal";
        }
    }
}