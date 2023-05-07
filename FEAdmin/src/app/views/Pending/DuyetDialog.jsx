import { Modal } from "antd";
import React from "react";


const DuyetDialog = (props) => {

    const { open, onCancel, idDuyet, handleOk } = props

    return (
        <Modal
            open={open}
            onOk={handleOk}
            onCancel={onCancel}
        >
            <p>Bạn có chắc muốn duyệt đơn {idDuyet}</p>
        </Modal>
    )
}

export default DuyetDialog