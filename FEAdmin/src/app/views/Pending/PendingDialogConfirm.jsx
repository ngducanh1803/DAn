import React from "react";
import {
    Modal, Input, Checkbox,
    DatePicker, Space
} from "antd"
import { useState } from "react";
import moment from "moment";
import styled from 'styled-components';


function PendingDialogConfirm(props) {

    const { title, open, onOk, onCancel } = props
    const [dateString, setDateString] = useState("")
    const [comment, setComment] = useState("")
    const [eligible, setEligible] = useState(false)

    return (
        <StyledModal
            title={title}
            centered
            open={open}
            onOk={() => onOk(dateString, comment, eligible)}
            onCancel={onCancel}
            okText="XÁC NHẬN"
            cancelText="HỦY"
        >
            <Space
                direction="vertical"
                style={{
                    width: '100%',
                }}
            >
                {title !== "Yêu cầu bổ sung" && (
                    <DatePicker
                        style={{
                            width: '100%',
                        }}
                        format="DD-MM-YYYY"
                        disabledDate={(current) => {
                            return current && current < moment().add(-1, "days")
                        }}
                        onChange={(date, dateString) => {
                            setDateString(dateString)
                        }}
                    />
                )}

                {title === "Xác nhận phê duyệt" && (
                    <Checkbox
                        checked={eligible}
                        onChange={() => setEligible(!eligible)}
                    >
                        Đã đủ điều kiện phê duyệt
                    </Checkbox>
                )}

                {title !== "Xác nhận phê duyệt" && (
                    <Input.TextArea
                        rows={4}
                        placeholder={title === "Yêu cầu bổ sung" ? "Nội dung" : "Lý do"}
                        style={{ resize: 'none' }}
                        onChange={(e) => {
                            setComment(e.target.value)
                        }}
                    />
                )}
            </Space>
        </StyledModal>
    )
}

export default PendingDialogConfirm

const StyledModal = styled(Modal)`
.ant-modal-footer .ant-btn-primary{
    background-color: green;
}

.ant-modal-footer .ant-btn-primary:hover{
    background-color: #009900
}
`;