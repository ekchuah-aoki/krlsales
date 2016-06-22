/*
 * Copyright 2009-2010 Ark Information Systems.
 */
package jp.co.arkinfosys.form.master;

import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.upload.FormFile;
import org.seasar.framework.container.annotation.tiger.Binding;
import org.seasar.framework.container.annotation.tiger.BindingType;
import org.seasar.struts.annotation.Arg;
import org.seasar.struts.annotation.Required;

/**
 * 商品Excel取込画面のアクションフォームクラスです.
 * @author Ark Information Systems
 *
 */
public class ImportProductExcelForm {

	/** アップロードファイル */
	@Required(arg0 = @Arg(key = "labels.file.formFile", resource = true))
	@Binding(bindingType = BindingType.NONE)
	public FormFile productExcelFile;

	/**
	 * 入力値のバリデートを行います.
	 * @return 表示するメッセージ
	 */
	public ActionMessages validate() {
		ActionMessages errors = new ActionMessages();

		if (this.productExcelFile.getFileSize() == 0) {
			// 0バイトファイル
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"errors.upload.size.zero"));
		}

		return errors;
	}

}
