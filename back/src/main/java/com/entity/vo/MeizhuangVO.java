package com.entity.vo;

import com.entity.MeizhuangEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * 商品
 * 手机端接口返回实体辅助类
 * （主要作用去除一些不必要的字段）
 */
@TableName("meizhuang")
public class MeizhuangVO implements Serializable {
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */

    @TableField(value = "id")
    private Integer id;


    /**
     * 商家
     */

    @TableField(value = "shangjia_id")
    private Integer shangjiaId;


    /**
     * 商品编号
     */

    @TableField(value = "meizhuang_uuid_number")
    private String meizhuangUuidNumber;


    /**
     * 商品名称
     */

    @TableField(value = "meizhuang_name")
    private String meizhuangName;


    /**
     * 商品照片
     */

    @TableField(value = "meizhuang_photo")
    private String meizhuangPhoto;


    /**
     * 品牌
     */

    @TableField(value = "meizhuang_pinpai")
    private String meizhuangPinpai;


    /**
     * 商品类型
     */

    @TableField(value = "meizhuang_types")
    private Integer meizhuangTypes;


    /**
     * 商品二级类型
     */

    @TableField(value = "meizhuang_erji_types")
    private Integer meizhuangErjiTypes;


    /**
     * 购买获得积分
     */

    @TableField(value = "meizhuang_price")
    private Integer meizhuangPrice;


    /**
     * 商品库存
     */

    @TableField(value = "meizhuang_kucun_number")
    private Integer meizhuangKucunNumber;


    /**
     * 商品原价
     */

    @TableField(value = "meizhuang_old_money")
    private Double meizhuangOldMoney;


    /**
     * 现价
     */

    @TableField(value = "meizhuang_new_money")
    private Double meizhuangNewMoney;


    /**
     * 点击次数
     */

    @TableField(value = "meizhuang_clicknum")
    private Integer meizhuangClicknum;


    /**
     * 商品审核
     */

    @TableField(value = "meizhuang_yesno_types")
    private Integer meizhuangYesnoTypes;


    /**
     * 商品介绍
     */

    @TableField(value = "meizhuang_content")
    private String meizhuangContent;


    /**
     * 是否上架
     */

    @TableField(value = "shangxia_types")
    private Integer shangxiaTypes;


    /**
     * 逻辑删除
     */

    @TableField(value = "meizhuang_delete")
    private Integer meizhuangDelete;


    /**
     * 创建时间  show1 show2 photoShow
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat

    @TableField(value = "create_time")
    private Date createTime;


    /**
	 * 设置：主键
	 */
    public Integer getId() {
        return id;
    }


    /**
	 * 获取：主键
	 */

    public void setId(Integer id) {
        this.id = id;
    }
    /**
	 * 设置：商家
	 */
    public Integer getShangjiaId() {
        return shangjiaId;
    }


    /**
	 * 获取：商家
	 */

    public void setShangjiaId(Integer shangjiaId) {
        this.shangjiaId = shangjiaId;
    }
    /**
	 * 设置：商品编号
	 */
    public String getMeizhuangUuidNumber() {
        return meizhuangUuidNumber;
    }


    /**
	 * 获取：商品编号
	 */

    public void setMeizhuangUuidNumber(String meizhuangUuidNumber) {
        this.meizhuangUuidNumber = meizhuangUuidNumber;
    }
    /**
	 * 设置：商品名称
	 */
    public String getMeizhuangName() {
        return meizhuangName;
    }


    /**
	 * 获取：商品名称
	 */

    public void setMeizhuangName(String meizhuangName) {
        this.meizhuangName = meizhuangName;
    }
    /**
	 * 设置：商品照片
	 */
    public String getMeizhuangPhoto() {
        return meizhuangPhoto;
    }


    /**
	 * 获取：商品照片
	 */

    public void setMeizhuangPhoto(String meizhuangPhoto) {
        this.meizhuangPhoto = meizhuangPhoto;
    }
    /**
	 * 设置：品牌
	 */
    public String getMeizhuangPinpai() {
        return meizhuangPinpai;
    }


    /**
	 * 获取：品牌
	 */

    public void setMeizhuangPinpai(String meizhuangPinpai) {
        this.meizhuangPinpai = meizhuangPinpai;
    }
    /**
	 * 设置：商品类型
	 */
    public Integer getMeizhuangTypes() {
        return meizhuangTypes;
    }


    /**
	 * 获取：商品类型
	 */

    public void setMeizhuangTypes(Integer meizhuangTypes) {
        this.meizhuangTypes = meizhuangTypes;
    }
    /**
	 * 设置：商品二级类型
	 */
    public Integer getMeizhuangErjiTypes() {
        return meizhuangErjiTypes;
    }


    /**
	 * 获取：商品二级类型
	 */

    public void setMeizhuangErjiTypes(Integer meizhuangErjiTypes) {
        this.meizhuangErjiTypes = meizhuangErjiTypes;
    }
    /**
	 * 设置：购买获得积分
	 */
    public Integer getMeizhuangPrice() {
        return meizhuangPrice;
    }


    /**
	 * 获取：购买获得积分
	 */

    public void setMeizhuangPrice(Integer meizhuangPrice) {
        this.meizhuangPrice = meizhuangPrice;
    }
    /**
	 * 设置：商品库存
	 */
    public Integer getMeizhuangKucunNumber() {
        return meizhuangKucunNumber;
    }


    /**
	 * 获取：商品库存
	 */

    public void setMeizhuangKucunNumber(Integer meizhuangKucunNumber) {
        this.meizhuangKucunNumber = meizhuangKucunNumber;
    }
    /**
	 * 设置：商品原价
	 */
    public Double getMeizhuangOldMoney() {
        return meizhuangOldMoney;
    }


    /**
	 * 获取：商品原价
	 */

    public void setMeizhuangOldMoney(Double meizhuangOldMoney) {
        this.meizhuangOldMoney = meizhuangOldMoney;
    }
    /**
	 * 设置：现价
	 */
    public Double getMeizhuangNewMoney() {
        return meizhuangNewMoney;
    }


    /**
	 * 获取：现价
	 */

    public void setMeizhuangNewMoney(Double meizhuangNewMoney) {
        this.meizhuangNewMoney = meizhuangNewMoney;
    }
    /**
	 * 设置：点击次数
	 */
    public Integer getMeizhuangClicknum() {
        return meizhuangClicknum;
    }


    /**
	 * 获取：点击次数
	 */

    public void setMeizhuangClicknum(Integer meizhuangClicknum) {
        this.meizhuangClicknum = meizhuangClicknum;
    }
    /**
	 * 设置：商品审核
	 */
    public Integer getMeizhuangYesnoTypes() {
        return meizhuangYesnoTypes;
    }


    /**
	 * 获取：商品审核
	 */

    public void setMeizhuangYesnoTypes(Integer meizhuangYesnoTypes) {
        this.meizhuangYesnoTypes = meizhuangYesnoTypes;
    }
    /**
	 * 设置：商品介绍
	 */
    public String getMeizhuangContent() {
        return meizhuangContent;
    }


    /**
	 * 获取：商品介绍
	 */

    public void setMeizhuangContent(String meizhuangContent) {
        this.meizhuangContent = meizhuangContent;
    }
    /**
	 * 设置：是否上架
	 */
    public Integer getShangxiaTypes() {
        return shangxiaTypes;
    }


    /**
	 * 获取：是否上架
	 */

    public void setShangxiaTypes(Integer shangxiaTypes) {
        this.shangxiaTypes = shangxiaTypes;
    }
    /**
	 * 设置：逻辑删除
	 */
    public Integer getMeizhuangDelete() {
        return meizhuangDelete;
    }


    /**
	 * 获取：逻辑删除
	 */

    public void setMeizhuangDelete(Integer meizhuangDelete) {
        this.meizhuangDelete = meizhuangDelete;
    }
    /**
	 * 设置：创建时间  show1 show2 photoShow
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 获取：创建时间  show1 show2 photoShow
	 */

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}
