package com.entity.view;

import com.entity.MeizhuangCollectionEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
import java.util.Date;

/**
 * 商品收藏
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 */
@TableName("meizhuang_collection")
public class MeizhuangCollectionView extends MeizhuangCollectionEntity implements Serializable {
    private static final long serialVersionUID = 1L;

		/**
		* 类型的值
		*/
		private String meizhuangCollectionValue;



		//级联表 meizhuang
			/**
			* 商品 的 商家
			*/
			private Integer meizhuangShangjiaId;
			/**
			* 商品编号
			*/
			private String meizhuangUuidNumber;
			/**
			* 商品名称
			*/
			private String meizhuangName;
			/**
			* 商品照片
			*/
			private String meizhuangPhoto;
			/**
			* 品牌
			*/
			private String meizhuangPinpai;
			/**
			* 商品类型
			*/
			private Integer meizhuangTypes;
				/**
				* 商品类型的值
				*/
				private String meizhuangValue;
			/**
			* 商品二级类型
			*/
			private Integer meizhuangErjiTypes;
				/**
				* 商品二级类型的值
				*/
				private String meizhuangErjiValue;
			/**
			* 购买获得积分
			*/
			private Integer meizhuangPrice;
			/**
			* 商品库存
			*/
			private Integer meizhuangKucunNumber;
			/**
			* 商品原价
			*/
			private Double meizhuangOldMoney;
			/**
			* 现价
			*/
			private Double meizhuangNewMoney;
			/**
			* 点击次数
			*/
			private Integer meizhuangClicknum;
			/**
			* 商品审核
			*/
			private Integer meizhuangYesnoTypes;
				/**
				* 商品审核的值
				*/
				private String meizhuangYesnoValue;
			/**
			* 商品介绍
			*/
			private String meizhuangContent;
			/**
			* 是否上架
			*/
			private Integer shangxiaTypes;
				/**
				* 是否上架的值
				*/
				private String shangxiaValue;
			/**
			* 逻辑删除
			*/
			private Integer meizhuangDelete;

		//级联表 yonghu
			/**
			* 用户姓名
			*/
			private String yonghuName;
			/**
			* 用户手机号
			*/
			private String yonghuPhone;
			/**
			* 用户身份证号
			*/
			private String yonghuIdNumber;
			/**
			* 用户头像
			*/
			private String yonghuPhoto;
			/**
			* 电子邮箱
			*/
			private String yonghuEmail;
			/**
			* 余额
			*/
			private Double newMoney;
			/**
			* 总积分
			*/
			private Double yonghuSumJifen;
			/**
			* 现积分
			*/
			private Double yonghuNewJifen;
			/**
			* 会员等级
			*/
			private Integer huiyuandengjiTypes;
				/**
				* 会员等级的值
				*/
				private String huiyuandengjiValue;

	public MeizhuangCollectionView() {

	}

	public MeizhuangCollectionView(MeizhuangCollectionEntity meizhuangCollectionEntity) {
		try {
			BeanUtils.copyProperties(this, meizhuangCollectionEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



			/**
			* 获取： 类型的值
			*/
			public String getMeizhuangCollectionValue() {
				return meizhuangCollectionValue;
			}
			/**
			* 设置： 类型的值
			*/
			public void setMeizhuangCollectionValue(String meizhuangCollectionValue) {
				this.meizhuangCollectionValue = meizhuangCollectionValue;
			}
















				//级联表的get和set meizhuang

					/**
					* 获取：商品 的 商家
					*/
					public Integer getMeizhuangShangjiaId() {
						return meizhuangShangjiaId;
					}
					/**
					* 设置：商品 的 商家
					*/
					public void setMeizhuangShangjiaId(Integer meizhuangShangjiaId) {
						this.meizhuangShangjiaId = meizhuangShangjiaId;
					}


					/**
					* 获取： 商品编号
					*/
					public String getMeizhuangUuidNumber() {
						return meizhuangUuidNumber;
					}
					/**
					* 设置： 商品编号
					*/
					public void setMeizhuangUuidNumber(String meizhuangUuidNumber) {
						this.meizhuangUuidNumber = meizhuangUuidNumber;
					}

					/**
					* 获取： 商品名称
					*/
					public String getMeizhuangName() {
						return meizhuangName;
					}
					/**
					* 设置： 商品名称
					*/
					public void setMeizhuangName(String meizhuangName) {
						this.meizhuangName = meizhuangName;
					}

					/**
					* 获取： 商品照片
					*/
					public String getMeizhuangPhoto() {
						return meizhuangPhoto;
					}
					/**
					* 设置： 商品照片
					*/
					public void setMeizhuangPhoto(String meizhuangPhoto) {
						this.meizhuangPhoto = meizhuangPhoto;
					}

					/**
					* 获取： 品牌
					*/
					public String getMeizhuangPinpai() {
						return meizhuangPinpai;
					}
					/**
					* 设置： 品牌
					*/
					public void setMeizhuangPinpai(String meizhuangPinpai) {
						this.meizhuangPinpai = meizhuangPinpai;
					}

					/**
					* 获取： 商品类型
					*/
					public Integer getMeizhuangTypes() {
						return meizhuangTypes;
					}
					/**
					* 设置： 商品类型
					*/
					public void setMeizhuangTypes(Integer meizhuangTypes) {
						this.meizhuangTypes = meizhuangTypes;
					}


						/**
						* 获取： 商品类型的值
						*/
						public String getMeizhuangValue() {
							return meizhuangValue;
						}
						/**
						* 设置： 商品类型的值
						*/
						public void setMeizhuangValue(String meizhuangValue) {
							this.meizhuangValue = meizhuangValue;
						}

					/**
					* 获取： 商品二级类型
					*/
					public Integer getMeizhuangErjiTypes() {
						return meizhuangErjiTypes;
					}
					/**
					* 设置： 商品二级类型
					*/
					public void setMeizhuangErjiTypes(Integer meizhuangErjiTypes) {
						this.meizhuangErjiTypes = meizhuangErjiTypes;
					}


						/**
						* 获取： 商品二级类型的值
						*/
						public String getMeizhuangErjiValue() {
							return meizhuangErjiValue;
						}
						/**
						* 设置： 商品二级类型的值
						*/
						public void setMeizhuangErjiValue(String meizhuangErjiValue) {
							this.meizhuangErjiValue = meizhuangErjiValue;
						}

					/**
					* 获取： 购买获得积分
					*/
					public Integer getMeizhuangPrice() {
						return meizhuangPrice;
					}
					/**
					* 设置： 购买获得积分
					*/
					public void setMeizhuangPrice(Integer meizhuangPrice) {
						this.meizhuangPrice = meizhuangPrice;
					}

					/**
					* 获取： 商品库存
					*/
					public Integer getMeizhuangKucunNumber() {
						return meizhuangKucunNumber;
					}
					/**
					* 设置： 商品库存
					*/
					public void setMeizhuangKucunNumber(Integer meizhuangKucunNumber) {
						this.meizhuangKucunNumber = meizhuangKucunNumber;
					}

					/**
					* 获取： 商品原价
					*/
					public Double getMeizhuangOldMoney() {
						return meizhuangOldMoney;
					}
					/**
					* 设置： 商品原价
					*/
					public void setMeizhuangOldMoney(Double meizhuangOldMoney) {
						this.meizhuangOldMoney = meizhuangOldMoney;
					}

					/**
					* 获取： 现价
					*/
					public Double getMeizhuangNewMoney() {
						return meizhuangNewMoney;
					}
					/**
					* 设置： 现价
					*/
					public void setMeizhuangNewMoney(Double meizhuangNewMoney) {
						this.meizhuangNewMoney = meizhuangNewMoney;
					}

					/**
					* 获取： 点击次数
					*/
					public Integer getMeizhuangClicknum() {
						return meizhuangClicknum;
					}
					/**
					* 设置： 点击次数
					*/
					public void setMeizhuangClicknum(Integer meizhuangClicknum) {
						this.meizhuangClicknum = meizhuangClicknum;
					}

					/**
					* 获取： 商品审核
					*/
					public Integer getMeizhuangYesnoTypes() {
						return meizhuangYesnoTypes;
					}
					/**
					* 设置： 商品审核
					*/
					public void setMeizhuangYesnoTypes(Integer meizhuangYesnoTypes) {
						this.meizhuangYesnoTypes = meizhuangYesnoTypes;
					}


						/**
						* 获取： 商品审核的值
						*/
						public String getMeizhuangYesnoValue() {
							return meizhuangYesnoValue;
						}
						/**
						* 设置： 商品审核的值
						*/
						public void setMeizhuangYesnoValue(String meizhuangYesnoValue) {
							this.meizhuangYesnoValue = meizhuangYesnoValue;
						}

					/**
					* 获取： 商品介绍
					*/
					public String getMeizhuangContent() {
						return meizhuangContent;
					}
					/**
					* 设置： 商品介绍
					*/
					public void setMeizhuangContent(String meizhuangContent) {
						this.meizhuangContent = meizhuangContent;
					}

					/**
					* 获取： 是否上架
					*/
					public Integer getShangxiaTypes() {
						return shangxiaTypes;
					}
					/**
					* 设置： 是否上架
					*/
					public void setShangxiaTypes(Integer shangxiaTypes) {
						this.shangxiaTypes = shangxiaTypes;
					}


						/**
						* 获取： 是否上架的值
						*/
						public String getShangxiaValue() {
							return shangxiaValue;
						}
						/**
						* 设置： 是否上架的值
						*/
						public void setShangxiaValue(String shangxiaValue) {
							this.shangxiaValue = shangxiaValue;
						}

					/**
					* 获取： 逻辑删除
					*/
					public Integer getMeizhuangDelete() {
						return meizhuangDelete;
					}
					/**
					* 设置： 逻辑删除
					*/
					public void setMeizhuangDelete(Integer meizhuangDelete) {
						this.meizhuangDelete = meizhuangDelete;
					}



















				//级联表的get和set yonghu

					/**
					* 获取： 用户姓名
					*/
					public String getYonghuName() {
						return yonghuName;
					}
					/**
					* 设置： 用户姓名
					*/
					public void setYonghuName(String yonghuName) {
						this.yonghuName = yonghuName;
					}

					/**
					* 获取： 用户手机号
					*/
					public String getYonghuPhone() {
						return yonghuPhone;
					}
					/**
					* 设置： 用户手机号
					*/
					public void setYonghuPhone(String yonghuPhone) {
						this.yonghuPhone = yonghuPhone;
					}

					/**
					* 获取： 用户身份证号
					*/
					public String getYonghuIdNumber() {
						return yonghuIdNumber;
					}
					/**
					* 设置： 用户身份证号
					*/
					public void setYonghuIdNumber(String yonghuIdNumber) {
						this.yonghuIdNumber = yonghuIdNumber;
					}

					/**
					* 获取： 用户头像
					*/
					public String getYonghuPhoto() {
						return yonghuPhoto;
					}
					/**
					* 设置： 用户头像
					*/
					public void setYonghuPhoto(String yonghuPhoto) {
						this.yonghuPhoto = yonghuPhoto;
					}

					/**
					* 获取： 电子邮箱
					*/
					public String getYonghuEmail() {
						return yonghuEmail;
					}
					/**
					* 设置： 电子邮箱
					*/
					public void setYonghuEmail(String yonghuEmail) {
						this.yonghuEmail = yonghuEmail;
					}

					/**
					* 获取： 余额
					*/
					public Double getNewMoney() {
						return newMoney;
					}
					/**
					* 设置： 余额
					*/
					public void setNewMoney(Double newMoney) {
						this.newMoney = newMoney;
					}

					/**
					* 获取： 总积分
					*/
					public Double getYonghuSumJifen() {
						return yonghuSumJifen;
					}
					/**
					* 设置： 总积分
					*/
					public void setYonghuSumJifen(Double yonghuSumJifen) {
						this.yonghuSumJifen = yonghuSumJifen;
					}

					/**
					* 获取： 现积分
					*/
					public Double getYonghuNewJifen() {
						return yonghuNewJifen;
					}
					/**
					* 设置： 现积分
					*/
					public void setYonghuNewJifen(Double yonghuNewJifen) {
						this.yonghuNewJifen = yonghuNewJifen;
					}

					/**
					* 获取： 会员等级
					*/
					public Integer getHuiyuandengjiTypes() {
						return huiyuandengjiTypes;
					}
					/**
					* 设置： 会员等级
					*/
					public void setHuiyuandengjiTypes(Integer huiyuandengjiTypes) {
						this.huiyuandengjiTypes = huiyuandengjiTypes;
					}


						/**
						* 获取： 会员等级的值
						*/
						public String getHuiyuandengjiValue() {
							return huiyuandengjiValue;
						}
						/**
						* 设置： 会员等级的值
						*/
						public void setHuiyuandengjiValue(String huiyuandengjiValue) {
							this.huiyuandengjiValue = huiyuandengjiValue;
						}



}
