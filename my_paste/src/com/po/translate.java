package com.po;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
public class translate {
	 public  Map<String,String>map =new HashMap<String,String>();
	 public  String solve_annotation(String content){//���ݶ�����ı����ݣ����ش�������ı���������洢��.html��
		init();
		String s[]=content.split("\n");
        String answer="";
        for (int i=0;i<s.length;i++){
        	if (s[i].indexOf("//")==-1){
        		s[i]=" "+s[i].trim()+" ";//���һ���ո���Ϊ�˷�����ĩת��
        	}else{
        		s[i]=" "+s[i].substring(0, s[i].indexOf("//")).trim()+" ";
        	}
        	if (s[i].length()==2)
        		continue;
        	s[i]=s[i].replace("<","&lt");//��ֹ&������
        	s[i]=s[i].replace(">","&gt");
        	Iterator<String>it=map.keySet().iterator();
        	while(it.hasNext()){
        		String temp=it.next();
        		int l=-1;
        		int end=0;
        		while (((l=s[i].indexOf(temp,end))!=-1)&&(!s[i].substring(l,l+3).equals("&lt"))&&(!s[i].substring(l,l+3).equals("&gt"))){//���ǵ�һ�п����ж���ظ��ؼ��ֺ�ת���ַ�
        			s[i]=s[i].substring(0,l).concat(map.get(temp)).concat(temp).concat("</span>").concat(s[i].substring(l+temp.length(),s[i].length()));
        			end=l+map.get(temp).length()+1;//����ǰ����ϵı�ǩ���ټ�һ
        		}
        	}
        	answer=answer+s[i]+"<br>";
        }
        return answer;
	}
	public void init(){//����map�ĳ�ʼ��
		 map.put(" int ","<span class=\"first\">");
		 map.put(" double ","<span class=\"first\">");
		 map.put(" float ","<span class=\"first\">");
		 map.put(" char ","<span class=\"first\">");
		 map.put(" long ","<span class=\"first\">");
		 map.put(" short ","<span class=\"first\">");
		 map.put(" bool ","<span class=\"first\">");
		 map.put(" typedef ","<span class=\"second\">");
		 map.put(" for","<span class=\"second\">");
		 map.put(" if","<span class=\"second\">");
		 map.put(" else","<span class=\"second\">");
		 map.put(" struct ","<span class=\"second\">");
		 map.put(" union ","<span class=\"second\">");
		 map.put(" enum ","<span class=\"second\">");
		 map.put(" auto ","<span class=\"second\">");
		 map.put(" case ","<span class=\"second\">");
		 map.put(" const ","<span class=\"second\">");
		 map.put(" default ","<span class=\"second\">");
		 map.put(" break ","<span class=\"second\">");
		 map.put(" #define ","<span class=\"second\">");
		 map.put(" continue ","<span class=\"second\">");
		 map.put(" return ","<span class=\"second\">");
		 map.put("return;","<span class=\"second\">");
		 map.put(" sizeof ","<span class=\"second\">");
		 map.put(" cin","<span class=\"second\">");
		 map.put(" cout","<span class=\"second\">");
		 map.put("+","<span class=\"third\">");
		 map.put("%","<span class=\"third\">");
		 map.put("-","<span class=\"third\">");
		 map.put("*","<span class=\"third\">");
		 map.put("^","<span class=\"third\">");
		 map.put("|","<span class=\"third\">");
		 map.put("&","<span class=\"third\">");
		 map.put("true","<span class=\"third\">");
		 map.put("false","<span class=\"third\">");
		 
	}
	public  void addrule(List<String>listA,List<String>listB){
		for (int i=0;i<listA.size();i++){//��ȡÿһ�����򣬲���ӽ���map��
			map.put(listA.get(i),"<span style=\"color:"+listB.get(i)+"\">");
			System.out.println(map);
		}
	}
	public static void main(String args[]){
		
	}
}
